; DESCRIPTION: Renders a black line between points (83, 173) and (312, 50).
; PLAN: r0=83(x1), r1=173(y1), r2=312(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 173
LDI r2, 312
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
