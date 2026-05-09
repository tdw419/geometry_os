; DESCRIPTION: Composite: Places a red line segment connecting (399, 123) to (412, 185) then Places a black 112x80 rectangle at position (82, 68).
; PLAN: r0=399(x1), r1=123(y1), r2=412(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=68(y), r7=112(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 123
LDI r2, 412
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 68
LDI r7, 112
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
