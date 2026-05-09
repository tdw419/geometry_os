; DESCRIPTION: Composite: . Then Places a black 92x31 rectangle at position (44, 144). Then Draws a yellow circle centered at (58, 195) with radius 21.
; PLAN: r0=44(x), r1=144(y), r2=92(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=58(x), r1=195(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 92x31 rectangle at position (44, 144).
; PLAN: r0=44(x), r1=144(y), r2=92(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 144
LDI r2, 92
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (58, 195) with radius 21.
; PLAN: r0=58(x), r1=195(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 195
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
