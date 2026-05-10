; DESCRIPTION: Composite: Creates a blue rectangular region at (232, 75) spanning 14 by 41 pixels then Renders a red line between points (54, 243) and (114, 6) then Places a magenta dot at position (21, 204).
; PLAN: r0=232(x), r1=75(y), r2=14(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x1), r6=243(y1), r7=114(x2), r8=6(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=21(x), r11=204(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 75
LDI r2, 14
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 243
LDI r7, 114
LDI r8, 6
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 204
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
