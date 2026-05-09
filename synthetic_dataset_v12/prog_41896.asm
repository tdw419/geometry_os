; DESCRIPTION: Composite: Places a yellow dot at position (367, 235) then Draws a orange circle centered at (360, 120) with radius 27 then Creates a yellow rectangular region at (341, 68) spanning 42 by 110 pixels.
; PLAN: r0=367(x), r1=235(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=120(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=341(x), r11=68(y), r12=42(width), r13=110(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 235
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 360
LDI r6, 120
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 341
LDI r11, 68
LDI r12, 42
LDI r13, 110
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
