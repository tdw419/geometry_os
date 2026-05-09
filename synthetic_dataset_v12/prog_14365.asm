; DESCRIPTION: Composite: Places a white line segment connecting (209, 161) to (10, 196) then Draws a cyan rectangle at (174, 11) with width 24 and height 110.
; PLAN: r0=209(x1), r1=161(y1), r2=10(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=11(y), r7=24(width), r8=110(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 161
LDI r2, 10
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 11
LDI r7, 24
LDI r8, 110
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
