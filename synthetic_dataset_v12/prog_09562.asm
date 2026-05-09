; DESCRIPTION: Composite: Renders a blue box of size 13x114 starting at (464, 118) then Places a yellow circle of radius 65 at center (127, 105).
; PLAN: r0=464(x), r1=118(y), r2=13(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=105(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 464
LDI r1, 118
LDI r2, 13
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 105
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
