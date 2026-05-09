; DESCRIPTION: Composite: Draws a magenta line from (167, 126) to (435, 184) then Places a purple circle of radius 27 at center (365, 53) then Sets a single black pixel at (25, 132).
; PLAN: r0=167(x1), r1=126(y1), r2=435(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=53(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=25(x), r11=132(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 126
LDI r2, 435
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 53
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 25
LDI r11, 132
LDI r12, 0x000000
PSET r10, r11, r12
HALT
