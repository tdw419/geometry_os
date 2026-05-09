; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (174, 172) with radius 69. Then Places a cyan 100x82 rectangle at position (108, 170).
; PLAN: r0=174(x), r1=172(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=108(x), r1=170(y), r2=100(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (174, 172) with radius 69.
; PLAN: r0=174(x), r1=172(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 172
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 100x82 rectangle at position (108, 170).
; PLAN: r0=108(x), r1=170(y), r2=100(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 170
LDI r2, 100
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
