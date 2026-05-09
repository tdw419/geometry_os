; DESCRIPTION: Composite: Places a yellow line segment connecting (61, 163) to (506, 180) then Draws a red rectangle at (235, 168) with width 22 and height 88.
; PLAN: r0=61(x1), r1=163(y1), r2=506(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=168(y), r7=22(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 163
LDI r2, 506
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 168
LDI r7, 22
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
