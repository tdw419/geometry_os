; DESCRIPTION: Composite: Renders a cyan disk with center (96, 46) and radius 13 then Sets a single orange pixel at (7, 217) then Draws a orange line from (211, 100) to (278, 64).
; PLAN: r0=96(x), r1=46(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=217(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=211(x1), r11=100(y1), r12=278(x2), r13=64(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 46
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 217
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 211
LDI r11, 100
LDI r12, 278
LDI r13, 64
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
