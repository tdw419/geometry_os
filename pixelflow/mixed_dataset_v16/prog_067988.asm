; DESCRIPTION: Composite: Renders a white line between points (80, 60) and (137, 4) then Draws a cyan rectangle at (289, 29) with width 117 and height 93 then Sets a single magenta pixel at (466, 121).
; PLAN: r0=80(x1), r1=60(y1), r2=137(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=29(y), r7=117(width), r8=93(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=466(x), r11=121(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 60
LDI r2, 137
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 29
LDI r7, 117
LDI r8, 93
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 121
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
