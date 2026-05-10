; DESCRIPTION: Composite: Renders a magenta box of size 62x66 starting at (369, 185) then Renders a black line between points (91, 31) and (450, 26).
; PLAN: r0=369(x), r1=185(y), r2=62(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x1), r6=31(y1), r7=450(x2), r8=26(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 185
LDI r2, 62
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 31
LDI r7, 450
LDI r8, 26
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
