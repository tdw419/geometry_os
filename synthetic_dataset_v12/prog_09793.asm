; DESCRIPTION: Composite: Renders a black line between points (22, 30) and (38, 143) then Creates a orange rectangular region at (292, 82) spanning 69 by 47 pixels then Places a red dot at position (465, 28).
; PLAN: r0=22(x1), r1=30(y1), r2=38(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=82(y), r7=69(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=465(x), r11=28(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 22
LDI r1, 30
LDI r2, 38
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 82
LDI r7, 69
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 28
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
