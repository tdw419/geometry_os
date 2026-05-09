; DESCRIPTION: Composite: Places a yellow dot at position (283, 241) then Renders a green box of size 65x41 starting at (157, 106) then Creates a red circular shape at (241, 212) with radius 14.
; PLAN: r0=283(x), r1=241(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=157(x), r6=106(y), r7=65(width), r8=41(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=212(y), r12=14(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 283
LDI r1, 241
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 157
LDI r6, 106
LDI r7, 65
LDI r8, 41
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 212
LDI r12, 14
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
