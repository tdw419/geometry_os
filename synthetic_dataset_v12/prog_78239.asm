; DESCRIPTION: Composite: Renders a magenta disk with center (376, 128) and radius 61 then Draws a white line from (253, 242) to (444, 203) then Sets a single orange pixel at (187, 168).
; PLAN: r0=376(x), r1=128(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x1), r6=242(y1), r7=444(x2), r8=203(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=168(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 128
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 242
LDI r7, 444
LDI r8, 203
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 168
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
