; DESCRIPTION: Composite: Renders a orange line between points (510, 156) and (400, 128) then Draws a cyan rectangle at (369, 73) with width 12 and height 24.
; PLAN: r0=510(x1), r1=156(y1), r2=400(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=73(y), r7=12(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 510
LDI r1, 156
LDI r2, 400
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 73
LDI r7, 12
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
