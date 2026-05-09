; DESCRIPTION: Composite: Renders a red line between points (352, 116) and (73, 247) then Draws a magenta rectangle at (334, 57) with width 105 and height 97 then Sets a single magenta pixel at (456, 163).
; PLAN: r0=352(x1), r1=116(y1), r2=73(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=57(y), r7=105(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=456(x), r11=163(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 116
LDI r2, 73
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 57
LDI r7, 105
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 163
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
