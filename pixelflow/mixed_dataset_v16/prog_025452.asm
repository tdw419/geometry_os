; DESCRIPTION: Composite: Renders a yellow box of size 70x21 starting at (85, 133) then Draws a yellow line from (260, 26) to (494, 54).
; PLAN: r0=85(x), r1=133(y), r2=70(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x1), r6=26(y1), r7=494(x2), r8=54(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 133
LDI r2, 70
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 26
LDI r7, 494
LDI r8, 54
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
