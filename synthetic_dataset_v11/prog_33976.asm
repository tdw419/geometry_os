; DESCRIPTION: Composite: . Then Places a purple 73x63 rectangle at position (81, 145). Then Draws a red circle centered at (125, 104) with radius 66.
; PLAN: r0=81(x), r1=145(y), r2=73(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x), r1=104(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 73x63 rectangle at position (81, 145).
; PLAN: r0=81(x), r1=145(y), r2=73(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 145
LDI r2, 73
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (125, 104) with radius 66.
; PLAN: r0=125(x), r1=104(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 104
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
