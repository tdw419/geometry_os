; DESCRIPTION: Composite: Renders a yellow line between points (282, 100) and (307, 192) then Places a black dot at position (511, 51) then Draws a cyan rectangle at (213, 54) with width 109 and height 120.
; PLAN: r0=282(x1), r1=100(y1), r2=307(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=51(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=213(x), r11=54(y), r12=109(width), r13=120(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 100
LDI r2, 307
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 51
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 213
LDI r11, 54
LDI r12, 109
LDI r13, 120
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
