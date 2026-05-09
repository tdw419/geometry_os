; DESCRIPTION: Composite: Places a green dot at position (441, 111) then Renders a purple box of size 18x101 starting at (204, 119) then Places a magenta circle of radius 60 at center (204, 112).
; PLAN: r0=441(x), r1=111(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=119(y), r7=18(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=204(x), r11=112(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 441
LDI r1, 111
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 204
LDI r6, 119
LDI r7, 18
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 112
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
