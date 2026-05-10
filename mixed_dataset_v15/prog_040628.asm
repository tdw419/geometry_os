; DESCRIPTION: Composite: Draws a green line from (245, 176) to (293, 43) then Creates a magenta rectangular region at (37, 160) spanning 32 by 17 pixels then Places a orange circle of radius 65 at center (391, 173).
; PLAN: r0=245(x1), r1=176(y1), r2=293(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=160(y), r7=32(width), r8=17(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=391(x), r11=173(y), r12=65(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 176
LDI r2, 293
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 160
LDI r7, 32
LDI r8, 17
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 173
LDI r12, 65
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
