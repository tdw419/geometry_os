; DESCRIPTION: Composite: Places a blue circle of radius 68 at center (182, 110) then Places a magenta dot at position (360, 228) then Creates a blue rectangular region at (415, 154) spanning 75 by 20 pixels.
; PLAN: r0=182(x), r1=110(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=228(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=154(y), r12=75(width), r13=20(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 110
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 228
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 415
LDI r11, 154
LDI r12, 75
LDI r13, 20
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
