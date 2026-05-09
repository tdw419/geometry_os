; DESCRIPTION: Renders a black line between points (173, 135) and (19, 96).
; PLAN: r0=173(x1), r1=135(y1), r2=19(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 135
LDI r2, 19
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
