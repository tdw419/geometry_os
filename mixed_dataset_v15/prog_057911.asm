; DESCRIPTION: Composite: Places a blue 68x75 rectangle at position (323, 91) then Places a magenta line segment connecting (299, 116) to (102, 179).
; PLAN: r0=323(x), r1=91(y), r2=68(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x1), r6=116(y1), r7=102(x2), r8=179(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 91
LDI r2, 68
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 116
LDI r7, 102
LDI r8, 179
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
