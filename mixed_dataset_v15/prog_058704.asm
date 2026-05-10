; DESCRIPTION: Composite: Creates a cyan rectangular region at (34, 166) spanning 98 by 81 pixels then Draws a white line from (145, 201) to (22, 28).
; PLAN: r0=34(x), r1=166(y), r2=98(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x1), r6=201(y1), r7=22(x2), r8=28(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 166
LDI r2, 98
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 201
LDI r7, 22
LDI r8, 28
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
