; DESCRIPTION: Composite: Renders a purple line between points (122, 195) and (134, 111) then Draws a magenta rectangle at (221, 74) with width 29 and height 82 then Places a black dot at position (196, 200).
; PLAN: r0=122(x1), r1=195(y1), r2=134(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=74(y), r7=29(width), r8=82(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=196(x), r11=200(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 195
LDI r2, 134
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 74
LDI r7, 29
LDI r8, 82
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 200
LDI r12, 0x000000
PSET r10, r11, r12
HALT
