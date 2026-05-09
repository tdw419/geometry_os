; DESCRIPTION: Renders a black line between points (289, 194) and (173, 218).
; PLAN: r0=289(x1), r1=194(y1), r2=173(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 194
LDI r2, 173
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
