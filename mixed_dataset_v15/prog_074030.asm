; DESCRIPTION: Composite: Renders a green line between points (72, 99) and (31, 69) then Draws a cyan rectangle at (328, 104) with width 91 and height 119.
; PLAN: r0=72(x1), r1=99(y1), r2=31(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=104(y), r7=91(width), r8=119(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 99
LDI r2, 31
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 104
LDI r7, 91
LDI r8, 119
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
