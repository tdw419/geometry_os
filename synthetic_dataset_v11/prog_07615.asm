; DESCRIPTION: Renders a cyan line between points (136, 70) and (219, 237).
; PLAN: r0=136(x1), r1=70(y1), r2=219(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 70
LDI r2, 219
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
