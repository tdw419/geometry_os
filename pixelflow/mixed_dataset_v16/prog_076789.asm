; DESCRIPTION: Composite: Creates a black rectangular region at (365, 21) spanning 95 by 19 pixels then Renders a magenta line between points (155, 128) and (262, 77) then Sets a single red pixel at (393, 184).
; PLAN: r0=365(x), r1=21(y), r2=95(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x1), r6=128(y1), r7=262(x2), r8=77(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=184(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 21
LDI r2, 95
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 128
LDI r7, 262
LDI r8, 77
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 184
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
