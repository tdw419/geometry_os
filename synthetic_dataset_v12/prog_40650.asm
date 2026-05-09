; DESCRIPTION: Composite: Places a blue line segment connecting (244, 117) to (23, 145) then Renders a blue box of size 63x75 starting at (166, 143).
; PLAN: r0=244(x1), r1=117(y1), r2=23(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=143(y), r7=63(width), r8=75(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 117
LDI r2, 23
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 143
LDI r7, 63
LDI r8, 75
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
