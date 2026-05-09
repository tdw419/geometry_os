; DESCRIPTION: Composite: Places a red 79x61 rectangle at position (51, 126) then Sets a single cyan pixel at (484, 9) then Places a magenta line segment connecting (384, 43) to (251, 245).
; PLAN: r0=51(x), r1=126(y), r2=79(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x), r6=9(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=384(x1), r11=43(y1), r12=251(x2), r13=245(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 126
LDI r2, 79
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 9
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 384
LDI r11, 43
LDI r12, 251
LDI r13, 245
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
