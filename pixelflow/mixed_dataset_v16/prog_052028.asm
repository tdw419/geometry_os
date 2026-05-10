; DESCRIPTION: Composite: Renders a purple line between points (387, 204) and (243, 99) then Places a black 112x111 rectangle at position (158, 18) then Places a purple dot at position (506, 102).
; PLAN: r0=387(x1), r1=204(y1), r2=243(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=18(y), r7=112(width), r8=111(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=506(x), r11=102(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 204
LDI r2, 243
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 18
LDI r7, 112
LDI r8, 111
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 506
LDI r11, 102
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
