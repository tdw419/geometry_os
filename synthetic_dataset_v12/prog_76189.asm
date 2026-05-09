; DESCRIPTION: Composite: Draws a purple line from (191, 169) to (87, 177) then Renders a yellow box of size 62x86 starting at (168, 40) then Places a blue dot at position (253, 51).
; PLAN: r0=191(x1), r1=169(y1), r2=87(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=40(y), r7=62(width), r8=86(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=51(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 191
LDI r1, 169
LDI r2, 87
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 40
LDI r7, 62
LDI r8, 86
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 51
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
