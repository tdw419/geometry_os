; DESCRIPTION: Composite: Renders a magenta box of size 77x120 starting at (309, 14) then Places a blue dot at position (63, 60) then Renders a magenta line between points (34, 208) and (496, 67).
; PLAN: r0=309(x), r1=14(y), r2=77(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=60(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=34(x1), r11=208(y1), r12=496(x2), r13=67(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 14
LDI r2, 77
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 60
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 34
LDI r11, 208
LDI r12, 496
LDI r13, 67
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
