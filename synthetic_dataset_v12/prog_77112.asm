; DESCRIPTION: Composite: Renders a blue box of size 26x24 starting at (485, 137) then Draws a yellow line from (488, 52) to (255, 18) then Places a magenta dot at position (450, 31).
; PLAN: r0=485(x), r1=137(y), r2=26(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x1), r6=52(y1), r7=255(x2), r8=18(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=450(x), r11=31(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 485
LDI r1, 137
LDI r2, 26
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 52
LDI r7, 255
LDI r8, 18
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 31
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
