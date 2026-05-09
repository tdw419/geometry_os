; DESCRIPTION: Composite: Places a purple dot at position (291, 173) then Renders a green box of size 64x65 starting at (419, 70) then Places a yellow circle of radius 44 at center (114, 54).
; PLAN: r0=291(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=70(y), r7=64(width), r8=65(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=114(x), r11=54(y), r12=44(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 173
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 419
LDI r6, 70
LDI r7, 64
LDI r8, 65
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 54
LDI r12, 44
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
