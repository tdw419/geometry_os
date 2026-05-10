; DESCRIPTION: Composite: Draws a black rectangle at (461, 77) with width 42 and height 120 then Renders a cyan line between points (486, 48) and (65, 127) then Places a purple dot at position (278, 99).
; PLAN: r0=461(x), r1=77(y), r2=42(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x1), r6=48(y1), r7=65(x2), r8=127(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=278(x), r11=99(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 461
LDI r1, 77
LDI r2, 42
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 48
LDI r7, 65
LDI r8, 127
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 99
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
