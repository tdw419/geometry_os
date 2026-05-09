; DESCRIPTION: Composite: Places a blue line segment connecting (114, 157) to (61, 129) then Draws a cyan rectangle at (175, 8) with width 16 and height 74.
; PLAN: r0=114(x1), r1=157(y1), r2=61(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=8(y), r7=16(width), r8=74(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 157
LDI r2, 61
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 8
LDI r7, 16
LDI r8, 74
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
