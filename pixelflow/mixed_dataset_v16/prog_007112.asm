; DESCRIPTION: Composite: Creates a green circular shape at (71, 95) with radius 35 then Sets a single magenta pixel at (300, 48) then Draws a black line from (60, 75) to (329, 169).
; PLAN: r0=71(x), r1=95(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x), r6=48(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=60(x1), r11=75(y1), r12=329(x2), r13=169(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 95
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 48
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 60
LDI r11, 75
LDI r12, 329
LDI r13, 169
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
