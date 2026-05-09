; DESCRIPTION: Composite: Places a cyan line segment connecting (260, 154) to (85, 159) then Draws a green rectangle at (255, 209) with width 67 and height 24.
; PLAN: r0=260(x1), r1=154(y1), r2=85(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=209(y), r7=67(width), r8=24(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 154
LDI r2, 85
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 209
LDI r7, 67
LDI r8, 24
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
