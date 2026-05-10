; DESCRIPTION: Composite: Places a green dot at position (284, 31) then Creates a blue rectangular region at (285, 90) spanning 93 by 17 pixels then Places a blue circle of radius 19 at center (436, 103).
; PLAN: r0=284(x), r1=31(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=90(y), r7=93(width), r8=17(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=436(x), r11=103(y), r12=19(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 284
LDI r1, 31
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 285
LDI r6, 90
LDI r7, 93
LDI r8, 17
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 103
LDI r12, 19
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
