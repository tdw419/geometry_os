; DESCRIPTION: Composite: Draws a red rectangle at (13, 138) with width 103 and height 99 then Renders a purple disk with center (437, 120) and radius 51 then Sets a single cyan pixel at (282, 209).
; PLAN: r0=13(x), r1=138(y), r2=103(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x), r6=120(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=282(x), r11=209(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 13
LDI r1, 138
LDI r2, 103
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 120
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 282
LDI r11, 209
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
