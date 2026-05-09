; DESCRIPTION: Composite: . Then Draws a black circle centered at (108, 190) with radius 65. Then Places a black 101x40 rectangle at position (23, 44).
; PLAN: r0=108(x), r1=190(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x), r1=44(y), r2=101(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (108, 190) with radius 65.
; PLAN: r0=108(x), r1=190(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 190
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 101x40 rectangle at position (23, 44).
; PLAN: r0=23(x), r1=44(y), r2=101(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 44
LDI r2, 101
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
