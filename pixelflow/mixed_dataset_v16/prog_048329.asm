; DESCRIPTION: Composite: Renders a cyan line between points (504, 201) and (302, 126) then Draws a black rectangle at (382, 112) with width 28 and height 114 then Places a red dot at position (185, 6).
; PLAN: r0=504(x1), r1=201(y1), r2=302(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=112(y), r7=28(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=185(x), r11=6(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 504
LDI r1, 201
LDI r2, 302
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 112
LDI r7, 28
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 6
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
