; DESCRIPTION: Composite: Renders a black line between points (137, 24) and (125, 14) then Draws a magenta rectangle at (329, 131) with width 23 and height 93 then Sets a single purple pixel at (92, 9).
; PLAN: r0=137(x1), r1=24(y1), r2=125(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=131(y), r7=23(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x), r11=9(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 137
LDI r1, 24
LDI r2, 125
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 131
LDI r7, 23
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 9
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
