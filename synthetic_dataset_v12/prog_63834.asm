; DESCRIPTION: Composite: Sets a single blue pixel at (280, 72) then Renders a yellow disk with center (500, 30) and radius 12 then Places a magenta 68x82 rectangle at position (439, 148).
; PLAN: r0=280(x), r1=72(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=500(x), r6=30(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x), r11=148(y), r12=68(width), r13=82(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 72
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 500
LDI r6, 30
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 148
LDI r12, 68
LDI r13, 82
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
