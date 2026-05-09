; DESCRIPTION: Composite: Places a blue circle of radius 27 at center (237, 175) then Places a magenta line segment connecting (228, 68) to (101, 70) then Places a black dot at position (293, 212).
; PLAN: r0=237(x), r1=175(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x1), r6=68(y1), r7=101(x2), r8=70(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=212(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 175
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 68
LDI r7, 101
LDI r8, 70
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 212
LDI r12, 0x000000
PSET r10, r11, r12
HALT
