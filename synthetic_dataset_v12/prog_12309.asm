; DESCRIPTION: Composite: Renders a red line between points (77, 47) and (91, 243) then Draws a blue rectangle at (1, 61) with width 105 and height 113 then Places a magenta dot at position (355, 175).
; PLAN: r0=77(x1), r1=47(y1), r2=91(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=61(y), r7=105(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=355(x), r11=175(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 77
LDI r1, 47
LDI r2, 91
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 61
LDI r7, 105
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 175
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
