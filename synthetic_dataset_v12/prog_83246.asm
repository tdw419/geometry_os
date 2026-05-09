; DESCRIPTION: Composite: Sets a single cyan pixel at (109, 250) then Renders a white box of size 92x25 starting at (24, 157) then Creates a cyan circular shape at (261, 161) with radius 53.
; PLAN: r0=109(x), r1=250(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=24(x), r6=157(y), r7=92(width), r8=25(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x), r11=161(y), r12=53(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 109
LDI r1, 250
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 24
LDI r6, 157
LDI r7, 92
LDI r8, 25
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 161
LDI r12, 53
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
