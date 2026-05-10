; DESCRIPTION: Composite: Places a blue dot at position (490, 179) then Draws a cyan circle centered at (227, 135) with radius 62 then Renders a red line between points (382, 73) and (195, 249).
; PLAN: r0=490(x), r1=179(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=135(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=382(x1), r11=73(y1), r12=195(x2), r13=249(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 179
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 135
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 382
LDI r11, 73
LDI r12, 195
LDI r13, 249
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
