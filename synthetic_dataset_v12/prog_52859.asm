; DESCRIPTION: Composite: Places a magenta dot at position (463, 185) then Places a black circle of radius 79 at center (397, 165) then Places a cyan line segment connecting (126, 209) to (353, 233).
; PLAN: r0=463(x), r1=185(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=165(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=126(x1), r11=209(y1), r12=353(x2), r13=233(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 185
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 397
LDI r6, 165
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 126
LDI r11, 209
LDI r12, 353
LDI r13, 233
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
