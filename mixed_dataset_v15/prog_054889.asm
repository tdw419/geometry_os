; DESCRIPTION: Composite: Renders a green line between points (88, 190) and (322, 2) then Places a red 33x24 rectangle at position (44, 38) then Sets a single magenta pixel at (188, 93).
; PLAN: r0=88(x1), r1=190(y1), r2=322(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=44(x), r6=38(y), r7=33(width), r8=24(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=188(x), r11=93(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 190
LDI r2, 322
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 38
LDI r7, 33
LDI r8, 24
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 93
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
