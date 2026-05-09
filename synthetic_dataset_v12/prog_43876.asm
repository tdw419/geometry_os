; DESCRIPTION: Composite: Creates a magenta rectangular region at (127, 30) spanning 49 by 30 pixels then Draws a green line from (431, 193) to (399, 254).
; PLAN: r0=127(x), r1=30(y), r2=49(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x1), r6=193(y1), r7=399(x2), r8=254(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 30
LDI r2, 49
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 193
LDI r7, 399
LDI r8, 254
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
