; DESCRIPTION: Composite: Renders a cyan box of size 105x114 starting at (275, 131) then Places a magenta circle of radius 68 at center (118, 101) then Sets a single magenta pixel at (448, 69).
; PLAN: r0=275(x), r1=131(y), r2=105(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=101(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=448(x), r11=69(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 275
LDI r1, 131
LDI r2, 105
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 101
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 448
LDI r11, 69
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
