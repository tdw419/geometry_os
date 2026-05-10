; DESCRIPTION: Composite: Places a magenta 33x75 rectangle at position (68, 14) then Renders a magenta line between points (34, 27) and (344, 235).
; PLAN: r0=68(x), r1=14(y), r2=33(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x1), r6=27(y1), r7=344(x2), r8=235(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 14
LDI r2, 33
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 27
LDI r7, 344
LDI r8, 235
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
