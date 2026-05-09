; DESCRIPTION: Composite: Places a yellow dot at position (435, 126) then Places a magenta 120x39 rectangle at position (229, 181) then Places a purple circle of radius 69 at center (390, 76).
; PLAN: r0=435(x), r1=126(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=181(y), r7=120(width), r8=39(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x), r11=76(y), r12=69(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 435
LDI r1, 126
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 229
LDI r6, 181
LDI r7, 120
LDI r8, 39
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 76
LDI r12, 69
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
