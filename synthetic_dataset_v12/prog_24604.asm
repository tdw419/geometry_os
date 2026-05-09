; DESCRIPTION: Composite: Renders a magenta line between points (47, 239) and (272, 245) then Draws a red rectangle at (84, 61) with width 51 and height 47 then Sets a single magenta pixel at (320, 90).
; PLAN: r0=47(x1), r1=239(y1), r2=272(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=61(y), r7=51(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=90(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 47
LDI r1, 239
LDI r2, 272
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 61
LDI r7, 51
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 90
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
