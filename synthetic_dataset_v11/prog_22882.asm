; DESCRIPTION: Renders a blue line between points (75, 78) and (173, 64).
; PLAN: r0=75(x1), r1=78(y1), r2=173(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 78
LDI r2, 173
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
