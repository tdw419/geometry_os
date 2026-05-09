; DESCRIPTION: Composite: Draws a black rectangle at (38, 107) with width 95 and height 51 then Places a cyan dot at position (240, 179) then Draws a magenta circle centered at (79, 177) with radius 76.
; PLAN: r0=38(x), r1=107(y), r2=95(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=179(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=79(x), r11=177(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 38
LDI r1, 107
LDI r2, 95
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 179
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 79
LDI r11, 177
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
