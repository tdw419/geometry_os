; DESCRIPTION: Composite: Draws a green rectangle at (234, 186) with width 29 and height 19 then Renders a yellow line between points (275, 64) and (469, 50).
; PLAN: r0=234(x), r1=186(y), r2=29(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=64(y1), r7=469(x2), r8=50(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 186
LDI r2, 29
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 64
LDI r7, 469
LDI r8, 50
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
