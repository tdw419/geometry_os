; DESCRIPTION: Composite: Creates a red circular shape at (414, 149) with radius 65 then Draws a green line from (246, 67) to (162, 13).
; PLAN: r0=414(x), r1=149(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x1), r6=67(y1), r7=162(x2), r8=13(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 149
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 67
LDI r7, 162
LDI r8, 13
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
