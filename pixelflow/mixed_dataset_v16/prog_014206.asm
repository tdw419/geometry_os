; DESCRIPTION: Composite: Draws a red circle centered at (311, 122) with radius 68 then Renders a orange box of size 112x72 starting at (194, 174) then Places a green dot at position (455, 247).
; PLAN: r0=311(x), r1=122(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=174(y), r7=112(width), r8=72(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=455(x), r11=247(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 122
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 174
LDI r7, 112
LDI r8, 72
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 247
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
