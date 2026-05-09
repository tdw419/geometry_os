; DESCRIPTION: Composite: . Then Places a yellow 30x74 rectangle at position (87, 73). Then Draws a orange circle centered at (159, 197) with radius 53.
; PLAN: r0=87(x), r1=73(y), r2=30(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=159(x), r1=197(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow 30x74 rectangle at position (87, 73).
; PLAN: r0=87(x), r1=73(y), r2=30(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 73
LDI r2, 30
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (159, 197) with radius 53.
; PLAN: r0=159(x), r1=197(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 197
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
