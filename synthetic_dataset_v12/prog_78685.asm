; DESCRIPTION: Composite: Renders a magenta line between points (199, 245) and (128, 53) then Sets a single black pixel at (128, 137) then Renders a magenta box of size 47x33 starting at (180, 136).
; PLAN: r0=199(x1), r1=245(y1), r2=128(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=137(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=180(x), r11=136(y), r12=47(width), r13=33(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 245
LDI r2, 128
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 137
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 180
LDI r11, 136
LDI r12, 47
LDI r13, 33
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
