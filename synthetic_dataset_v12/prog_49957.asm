; DESCRIPTION: Renders a cyan line between points (2, 113) and (371, 132).
; PLAN: r0=2(x1), r1=113(y1), r2=371(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 113
LDI r2, 371
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
