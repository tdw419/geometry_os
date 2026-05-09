; DESCRIPTION: Renders a black line between points (92, 224) and (132, 104).
; PLAN: r0=92(x1), r1=224(y1), r2=132(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 224
LDI r2, 132
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
