; DESCRIPTION: Composite: Draws a green line from (107, 188) to (284, 134) then Draws a black rectangle at (334, 136) with width 33 and height 10.
; PLAN: r0=107(x1), r1=188(y1), r2=284(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=136(y), r7=33(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 188
LDI r2, 284
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 136
LDI r7, 33
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
