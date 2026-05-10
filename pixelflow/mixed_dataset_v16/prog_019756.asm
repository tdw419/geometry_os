; DESCRIPTION: Composite: Renders a green line between points (482, 181) and (490, 91) then Creates a white rectangular region at (120, 162) spanning 63 by 64 pixels.
; PLAN: r0=482(x1), r1=181(y1), r2=490(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=162(y), r7=63(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 482
LDI r1, 181
LDI r2, 490
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 162
LDI r7, 63
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
