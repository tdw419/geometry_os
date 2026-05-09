; DESCRIPTION: Composite: Renders a blue line between points (466, 36) and (430, 25) then Renders a red box of size 50x26 starting at (157, 101) then Sets a single cyan pixel at (108, 134).
; PLAN: r0=466(x1), r1=36(y1), r2=430(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=101(y), r7=50(width), r8=26(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=134(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 466
LDI r1, 36
LDI r2, 430
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 101
LDI r7, 50
LDI r8, 26
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 134
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
