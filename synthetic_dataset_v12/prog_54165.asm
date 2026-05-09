; DESCRIPTION: Composite: Creates a green rectangular region at (142, 197) spanning 96 by 37 pixels then Places a black line segment connecting (414, 59) to (63, 36).
; PLAN: r0=142(x), r1=197(y), r2=96(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x1), r6=59(y1), r7=63(x2), r8=36(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 197
LDI r2, 96
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 59
LDI r7, 63
LDI r8, 36
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
