; DESCRIPTION: Composite: Draws a white rectangle at (221, 30) with width 12 and height 108 then Sets a single black pixel at (216, 223) then Places a orange circle of radius 76 at center (301, 103).
; PLAN: r0=221(x), r1=30(y), r2=12(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=223(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=301(x), r11=103(y), r12=76(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 30
LDI r2, 12
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 223
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 301
LDI r11, 103
LDI r12, 76
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
