; DESCRIPTION: Composite: Draws a cyan rectangle at (230, 97) with width 69 and height 77 then Sets a single magenta pixel at (51, 242) then Renders a black disk with center (111, 168) and radius 21.
; PLAN: r0=230(x), r1=97(y), r2=69(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x), r6=242(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=111(x), r11=168(y), r12=21(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 97
LDI r2, 69
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 242
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 111
LDI r11, 168
LDI r12, 21
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
