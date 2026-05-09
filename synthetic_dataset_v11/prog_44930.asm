; DESCRIPTION: Renders a cyan line between points (3, 18) and (113, 7).
; PLAN: r0=3(x1), r1=18(y1), r2=113(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 18
LDI r2, 113
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
