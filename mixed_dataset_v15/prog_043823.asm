; DESCRIPTION: Composite: Places a magenta dot at position (259, 141) then Places a green line segment connecting (79, 79) to (69, 95) then Renders a orange disk with center (269, 134) and radius 68.
; PLAN: r0=259(x), r1=141(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=79(x1), r6=79(y1), r7=69(x2), r8=95(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=269(x), r11=134(y), r12=68(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 141
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 79
LDI r7, 69
LDI r8, 95
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 134
LDI r12, 68
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
