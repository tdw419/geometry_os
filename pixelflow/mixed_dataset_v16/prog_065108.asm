; DESCRIPTION: Composite: Draws a black line from (271, 253) to (169, 12) then Places a orange circle of radius 15 at center (374, 110).
; PLAN: r0=271(x1), r1=253(y1), r2=169(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=110(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 253
LDI r2, 169
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 110
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
