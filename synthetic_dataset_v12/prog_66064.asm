; DESCRIPTION: Composite: Creates a green rectangular region at (272, 83) spanning 101 by 100 pixels then Renders a blue line between points (144, 3) and (207, 111) then Places a red dot at position (467, 180).
; PLAN: r0=272(x), r1=83(y), r2=101(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x1), r6=3(y1), r7=207(x2), r8=111(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=467(x), r11=180(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 83
LDI r2, 101
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 3
LDI r7, 207
LDI r8, 111
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 467
LDI r11, 180
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
