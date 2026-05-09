; DESCRIPTION: Composite: Places a yellow line segment connecting (327, 34) to (21, 254) then Draws a red rectangle at (75, 134) with width 38 and height 33.
; PLAN: r0=327(x1), r1=34(y1), r2=21(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=134(y), r7=38(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 34
LDI r2, 21
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 134
LDI r7, 38
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
