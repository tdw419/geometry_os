; DESCRIPTION: Composite: Places a orange line segment connecting (200, 154) to (427, 228) then Draws a yellow rectangle at (383, 21) with width 27 and height 42.
; PLAN: r0=200(x1), r1=154(y1), r2=427(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=21(y), r7=27(width), r8=42(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 154
LDI r2, 427
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 21
LDI r7, 27
LDI r8, 42
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
