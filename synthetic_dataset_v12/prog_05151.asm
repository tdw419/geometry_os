; DESCRIPTION: Composite: Places a cyan 52x77 rectangle at position (88, 83) then Renders a blue line between points (87, 227) and (445, 101) then Places a blue dot at position (265, 163).
; PLAN: r0=88(x), r1=83(y), r2=52(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=227(y1), r7=445(x2), r8=101(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=163(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 83
LDI r2, 52
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 227
LDI r7, 445
LDI r8, 101
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 163
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
