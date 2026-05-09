; DESCRIPTION: Composite: Places a red 19x65 rectangle at position (274, 25) then Renders a yellow line between points (303, 179) and (49, 66) then Places a yellow dot at position (191, 0).
; PLAN: r0=274(x), r1=25(y), r2=19(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x1), r6=179(y1), r7=49(x2), r8=66(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=191(x), r11=0(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 25
LDI r2, 19
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 179
LDI r7, 49
LDI r8, 66
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 0
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
