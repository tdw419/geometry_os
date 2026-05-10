; DESCRIPTION: Composite: Renders a green box of size 100x108 starting at (176, 6) then Places a orange dot at position (204, 245) then Renders a cyan line between points (155, 68) and (462, 246).
; PLAN: r0=176(x), r1=6(y), r2=100(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=245(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=155(x1), r11=68(y1), r12=462(x2), r13=246(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 6
LDI r2, 100
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 245
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 155
LDI r11, 68
LDI r12, 462
LDI r13, 246
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
