; DESCRIPTION: Composite: Places a yellow dot at position (144, 122) then Draws a green circle centered at (413, 110) with radius 12 then Renders a white box of size 36x115 starting at (321, 42).
; PLAN: r0=144(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=110(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=321(x), r11=42(y), r12=36(width), r13=115(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 122
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 413
LDI r6, 110
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 321
LDI r11, 42
LDI r12, 36
LDI r13, 115
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
