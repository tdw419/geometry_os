; DESCRIPTION: Composite: Draws a yellow line from (147, 176) to (462, 223) then Renders a red box of size 86x21 starting at (307, 202).
; PLAN: r0=147(x1), r1=176(y1), r2=462(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=202(y), r7=86(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 176
LDI r2, 462
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 202
LDI r7, 86
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
