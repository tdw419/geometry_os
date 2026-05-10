; DESCRIPTION: Composite: Renders a blue line between points (391, 98) and (481, 79) then Renders a orange box of size 43x109 starting at (440, 29).
; PLAN: r0=391(x1), r1=98(y1), r2=481(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=29(y), r7=43(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 98
LDI r2, 481
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 29
LDI r7, 43
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
