; DESCRIPTION: Composite: Places a blue dot at position (415, 15) then Draws a magenta circle centered at (328, 55) with radius 47 then Creates a green rectangular region at (385, 215) spanning 27 by 21 pixels.
; PLAN: r0=415(x), r1=15(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=55(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x), r11=215(y), r12=27(width), r13=21(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 15
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 55
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 215
LDI r12, 27
LDI r13, 21
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
