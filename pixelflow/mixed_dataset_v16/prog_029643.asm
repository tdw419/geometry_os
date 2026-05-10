; DESCRIPTION: Composite: Renders a magenta box of size 105x41 starting at (70, 212) then Draws a black line from (295, 140) to (79, 253) then Places a white circle of radius 74 at center (95, 180).
; PLAN: r0=70(x), r1=212(y), r2=105(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x1), r6=140(y1), r7=79(x2), r8=253(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=95(x), r11=180(y), r12=74(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 70
LDI r1, 212
LDI r2, 105
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 140
LDI r7, 79
LDI r8, 253
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 180
LDI r12, 74
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
