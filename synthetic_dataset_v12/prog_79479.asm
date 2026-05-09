; DESCRIPTION: Renders a cyan line between points (1, 113) and (126, 64).
; PLAN: r0=1(x1), r1=113(y1), r2=126(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 113
LDI r2, 126
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
