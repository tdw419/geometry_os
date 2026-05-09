; DESCRIPTION: Composite: Renders a magenta box of size 15x107 starting at (204, 66) then Draws a black line from (219, 195) to (341, 99) then Places a blue dot at position (384, 132).
; PLAN: r0=204(x), r1=66(y), r2=15(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x1), r6=195(y1), r7=341(x2), r8=99(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=384(x), r11=132(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 66
LDI r2, 15
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 195
LDI r7, 341
LDI r8, 99
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 132
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
