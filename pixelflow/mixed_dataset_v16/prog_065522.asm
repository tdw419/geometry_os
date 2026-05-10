; DESCRIPTION: Composite: Places a blue dot at position (323, 54) then Renders a magenta box of size 40x75 starting at (453, 140) then Places a magenta line segment connecting (256, 254) to (93, 193).
; PLAN: r0=323(x), r1=54(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=453(x), r6=140(y), r7=40(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x1), r11=254(y1), r12=93(x2), r13=193(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 54
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 453
LDI r6, 140
LDI r7, 40
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 254
LDI r12, 93
LDI r13, 193
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
