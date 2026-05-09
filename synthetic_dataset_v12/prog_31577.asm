; DESCRIPTION: Composite: Places a blue 98x114 rectangle at position (32, 47) then Places a orange dot at position (510, 179) then Places a magenta line segment connecting (234, 165) to (195, 205).
; PLAN: r0=32(x), r1=47(y), r2=98(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=510(x), r6=179(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=234(x1), r11=165(y1), r12=195(x2), r13=205(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 47
LDI r2, 98
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 179
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 234
LDI r11, 165
LDI r12, 195
LDI r13, 205
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
