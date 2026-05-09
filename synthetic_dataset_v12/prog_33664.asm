; DESCRIPTION: Composite: Places a cyan line segment connecting (9, 146) to (154, 80) then Draws a magenta rectangle at (479, 67) with width 17 and height 54.
; PLAN: r0=9(x1), r1=146(y1), r2=154(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=479(x), r6=67(y), r7=17(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 9
LDI r1, 146
LDI r2, 154
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 67
LDI r7, 17
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
