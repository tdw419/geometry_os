; DESCRIPTION: Composite: Draws a cyan line from (472, 94) to (350, 180) then Draws a green rectangle at (41, 155) with width 80 and height 28 then Places a magenta dot at position (71, 234).
; PLAN: r0=472(x1), r1=94(y1), r2=350(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=155(y), r7=80(width), r8=28(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x), r11=234(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 472
LDI r1, 94
LDI r2, 350
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 155
LDI r7, 80
LDI r8, 28
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 234
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
