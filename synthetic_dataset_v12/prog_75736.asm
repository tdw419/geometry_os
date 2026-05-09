; DESCRIPTION: Composite: Renders a magenta box of size 73x96 starting at (35, 108) then Draws a red line from (66, 156) to (183, 220).
; PLAN: r0=35(x), r1=108(y), r2=73(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x1), r6=156(y1), r7=183(x2), r8=220(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 108
LDI r2, 73
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 156
LDI r7, 183
LDI r8, 220
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
