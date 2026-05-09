; DESCRIPTION: Composite: Places a yellow 108x91 rectangle at position (226, 89) then Draws a magenta circle centered at (330, 97) with radius 77.
; PLAN: r0=226(x), r1=89(y), r2=108(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=97(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 226
LDI r1, 89
LDI r2, 108
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 97
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
