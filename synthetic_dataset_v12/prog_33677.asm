; DESCRIPTION: Composite: Places a black circle of radius 42 at center (251, 178) then Creates a black rectangular region at (414, 186) spanning 27 by 21 pixels.
; PLAN: r0=251(x), r1=178(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=186(y), r7=27(width), r8=21(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 178
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 186
LDI r7, 27
LDI r8, 21
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
