; DESCRIPTION: Composite: Creates a green circular shape at (240, 56) with radius 51 then Draws a magenta line from (488, 181) to (319, 64) then Places a cyan dot at position (155, 72).
; PLAN: r0=240(x), r1=56(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x1), r6=181(y1), r7=319(x2), r8=64(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=72(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 56
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 181
LDI r7, 319
LDI r8, 64
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 72
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
