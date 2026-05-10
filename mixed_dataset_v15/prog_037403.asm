; DESCRIPTION: Composite: Places a blue dot at position (448, 190) then Draws a magenta circle centered at (145, 63) with radius 40 then Places a orange 66x86 rectangle at position (103, 139).
; PLAN: r0=448(x), r1=190(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=63(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=103(x), r11=139(y), r12=66(width), r13=86(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 190
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 145
LDI r6, 63
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 103
LDI r11, 139
LDI r12, 66
LDI r13, 86
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
