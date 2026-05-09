; DESCRIPTION: Composite: Sets a single cyan pixel at (495, 204) then Creates a black rectangular region at (215, 139) spanning 12 by 116 pixels then Renders a green disk with center (39, 63) and radius 11.
; PLAN: r0=495(x), r1=204(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=139(y), r7=12(width), r8=116(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=39(x), r11=63(y), r12=11(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 495
LDI r1, 204
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 215
LDI r6, 139
LDI r7, 12
LDI r8, 116
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 63
LDI r12, 11
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
