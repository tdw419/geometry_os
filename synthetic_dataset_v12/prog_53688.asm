; DESCRIPTION: Composite: Renders a magenta line between points (472, 156) and (85, 211) then Places a magenta dot at position (48, 102) then Places a green 88x103 rectangle at position (228, 97).
; PLAN: r0=472(x1), r1=156(y1), r2=85(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=102(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=228(x), r11=97(y), r12=88(width), r13=103(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 156
LDI r2, 85
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 102
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 228
LDI r11, 97
LDI r12, 88
LDI r13, 103
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
