; DESCRIPTION: Composite: Places a blue 55x42 rectangle at position (4, 190) then Sets a single yellow pixel at (151, 166) then Places a blue circle of radius 39 at center (171, 39).
; PLAN: r0=4(x), r1=190(y), r2=55(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=166(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=171(x), r11=39(y), r12=39(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 4
LDI r1, 190
LDI r2, 55
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 166
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 171
LDI r11, 39
LDI r12, 39
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
