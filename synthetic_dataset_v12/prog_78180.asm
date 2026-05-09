; DESCRIPTION: Composite: Places a white dot at position (0, 223) then Places a magenta line segment connecting (448, 232) to (66, 95) then Renders a magenta box of size 68x85 starting at (125, 49).
; PLAN: r0=0(x), r1=223(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=448(x1), r6=232(y1), r7=66(x2), r8=95(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=49(y), r12=68(width), r13=85(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 0
LDI r1, 223
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 232
LDI r7, 66
LDI r8, 95
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 49
LDI r12, 68
LDI r13, 85
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
