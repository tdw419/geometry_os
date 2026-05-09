; DESCRIPTION: Composite: Places a red line segment connecting (396, 12) to (182, 151) then Draws a cyan rectangle at (65, 88) with width 29 and height 41 then Sets a single magenta pixel at (153, 210).
; PLAN: r0=396(x1), r1=12(y1), r2=182(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=88(y), r7=29(width), r8=41(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=153(x), r11=210(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 12
LDI r2, 182
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 88
LDI r7, 29
LDI r8, 41
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 210
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
