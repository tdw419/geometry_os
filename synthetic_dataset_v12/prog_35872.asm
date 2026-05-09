; DESCRIPTION: Composite: Renders a green box of size 76x43 starting at (161, 118) then Renders a cyan line between points (488, 153) and (267, 76) then Sets a single cyan pixel at (196, 69).
; PLAN: r0=161(x), r1=118(y), r2=76(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x1), r6=153(y1), r7=267(x2), r8=76(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=69(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 161
LDI r1, 118
LDI r2, 76
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 153
LDI r7, 267
LDI r8, 76
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 69
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
