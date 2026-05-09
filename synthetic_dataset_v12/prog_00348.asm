; DESCRIPTION: Composite: Renders a magenta line between points (343, 65) and (182, 17) then Sets a single cyan pixel at (484, 90) then Places a green 113x77 rectangle at position (44, 74).
; PLAN: r0=343(x1), r1=65(y1), r2=182(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=90(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=44(x), r11=74(y), r12=113(width), r13=77(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 65
LDI r2, 182
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 90
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 44
LDI r11, 74
LDI r12, 113
LDI r13, 77
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
