; DESCRIPTION: Composite: Draws a orange rectangle at (190, 109) with width 105 and height 64 then Renders a cyan line between points (140, 10) and (286, 170) then Places a magenta dot at position (259, 163).
; PLAN: r0=190(x), r1=109(y), r2=105(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x1), r6=10(y1), r7=286(x2), r8=170(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=259(x), r11=163(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 109
LDI r2, 105
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 10
LDI r7, 286
LDI r8, 170
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 163
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
