; DESCRIPTION: Composite: Sets a single blue pixel at (231, 228) then Renders a magenta line between points (207, 193) and (133, 254) then Creates a blue circular shape at (214, 161) with radius 55.
; PLAN: r0=231(x), r1=228(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=207(x1), r6=193(y1), r7=133(x2), r8=254(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=214(x), r11=161(y), r12=55(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 231
LDI r1, 228
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 207
LDI r6, 193
LDI r7, 133
LDI r8, 254
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 161
LDI r12, 55
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
