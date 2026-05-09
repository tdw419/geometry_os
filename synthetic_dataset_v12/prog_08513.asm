; DESCRIPTION: Composite: Places a green 103x57 rectangle at position (366, 19) then Draws a yellow circle centered at (144, 112) with radius 74.
; PLAN: r0=366(x), r1=19(y), r2=103(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=112(y), r7=74(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 366
LDI r1, 19
LDI r2, 103
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 112
LDI r7, 74
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
