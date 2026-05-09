; DESCRIPTION: Renders a black line between points (173, 193) and (12, 155).
; PLAN: r0=173(x1), r1=193(y1), r2=12(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 193
LDI r2, 12
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
