; DESCRIPTION: Renders a green line between points (30, 55) and (173, 78).
; PLAN: r0=30(x1), r1=55(y1), r2=173(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 55
LDI r2, 173
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
