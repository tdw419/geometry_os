; DESCRIPTION: Composite: Places a green 53x11 rectangle at position (123, 111) then Renders a red line between points (421, 123) and (473, 144) then Places a red dot at position (471, 65).
; PLAN: r0=123(x), r1=111(y), r2=53(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x1), r6=123(y1), r7=473(x2), r8=144(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=471(x), r11=65(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 123
LDI r1, 111
LDI r2, 53
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 123
LDI r7, 473
LDI r8, 144
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 65
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
