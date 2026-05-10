; DESCRIPTION: Composite: Renders a green line between points (346, 235) and (483, 212) then Renders a green box of size 81x32 starting at (153, 46) then Places a yellow dot at position (194, 221).
; PLAN: r0=346(x1), r1=235(y1), r2=483(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=46(y), r7=81(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=194(x), r11=221(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 235
LDI r2, 483
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 46
LDI r7, 81
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 221
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
