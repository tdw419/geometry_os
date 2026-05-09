; DESCRIPTION: Composite: . Then Draws a black circle centered at (66, 144) with radius 56. Then Places a black 115x117 rectangle at position (68, 89).
; PLAN: r0=66(x), r1=144(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=68(x), r1=89(y), r2=115(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (66, 144) with radius 56.
; PLAN: r0=66(x), r1=144(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 144
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 115x117 rectangle at position (68, 89).
; PLAN: r0=68(x), r1=89(y), r2=115(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 89
LDI r2, 115
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
