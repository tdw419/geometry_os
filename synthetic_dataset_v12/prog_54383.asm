; DESCRIPTION: Composite: Renders a yellow line between points (123, 242) and (55, 60) then Draws a green rectangle at (195, 167) with width 58 and height 39.
; PLAN: r0=123(x1), r1=242(y1), r2=55(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=167(y), r7=58(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 242
LDI r2, 55
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 167
LDI r7, 58
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
