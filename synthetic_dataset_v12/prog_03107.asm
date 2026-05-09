; DESCRIPTION: Composite: Places a yellow 112x57 rectangle at position (329, 4) then Places a yellow dot at position (306, 216) then Places a yellow circle of radius 26 at center (91, 108).
; PLAN: r0=329(x), r1=4(y), r2=112(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=216(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=91(x), r11=108(y), r12=26(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 4
LDI r2, 112
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 216
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 91
LDI r11, 108
LDI r12, 26
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
