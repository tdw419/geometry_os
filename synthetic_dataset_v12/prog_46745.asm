; DESCRIPTION: Composite: Draws a yellow line from (501, 99) to (283, 3) then Renders a green box of size 61x109 starting at (171, 23).
; PLAN: r0=501(x1), r1=99(y1), r2=283(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=23(y), r7=61(width), r8=109(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 99
LDI r2, 283
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 23
LDI r7, 61
LDI r8, 109
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
