; DESCRIPTION: Composite: Renders a magenta box of size 22x54 starting at (325, 121) then Draws a orange line from (74, 160) to (488, 190) then Places a white dot at position (460, 55).
; PLAN: r0=325(x), r1=121(y), r2=22(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x1), r6=160(y1), r7=488(x2), r8=190(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=460(x), r11=55(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 121
LDI r2, 22
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 160
LDI r7, 488
LDI r8, 190
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 55
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
