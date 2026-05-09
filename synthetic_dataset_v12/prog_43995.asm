; DESCRIPTION: Composite: Places a blue dot at position (162, 254) then Renders a blue disk with center (107, 137) and radius 30 then Creates a red rectangular region at (157, 74) spanning 99 by 54 pixels.
; PLAN: r0=162(x), r1=254(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=137(y), r7=30(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=157(x), r11=74(y), r12=99(width), r13=54(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 254
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 137
LDI r7, 30
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 157
LDI r11, 74
LDI r12, 99
LDI r13, 54
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
