; DESCRIPTION: Composite: Sets a single black pixel at (29, 164) then Places a red line segment connecting (295, 106) to (428, 74) then Renders a magenta box of size 39x78 starting at (223, 40).
; PLAN: r0=29(x), r1=164(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=295(x1), r6=106(y1), r7=428(x2), r8=74(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=40(y), r12=39(width), r13=78(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 164
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 295
LDI r6, 106
LDI r7, 428
LDI r8, 74
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 40
LDI r12, 39
LDI r13, 78
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
