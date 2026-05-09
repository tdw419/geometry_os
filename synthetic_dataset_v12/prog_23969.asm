; DESCRIPTION: Composite: Draws a cyan line from (114, 150) to (462, 65) then Places a red circle of radius 12 at center (471, 209) then Renders a green box of size 81x51 starting at (420, 127).
; PLAN: r0=114(x1), r1=150(y1), r2=462(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=471(x), r6=209(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=420(x), r11=127(y), r12=81(width), r13=51(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 150
LDI r2, 462
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 209
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 420
LDI r11, 127
LDI r12, 81
LDI r13, 51
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
