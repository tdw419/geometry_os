; DESCRIPTION: Composite: Renders a red line between points (438, 96) and (280, 64) then Places a blue dot at position (450, 240) then Draws a cyan rectangle at (26, 163) with width 44 and height 51.
; PLAN: r0=438(x1), r1=96(y1), r2=280(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=240(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=26(x), r11=163(y), r12=44(width), r13=51(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 96
LDI r2, 280
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 240
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 26
LDI r11, 163
LDI r12, 44
LDI r13, 51
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
