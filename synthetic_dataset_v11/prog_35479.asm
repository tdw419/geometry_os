; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (170, 158) with radius 67. Then Places a green 100x46 rectangle at position (91, 21).
; PLAN: r0=170(x), r1=158(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=91(x), r1=21(y), r2=100(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (170, 158) with radius 67.
; PLAN: r0=170(x), r1=158(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 158
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 100x46 rectangle at position (91, 21).
; PLAN: r0=91(x), r1=21(y), r2=100(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 21
LDI r2, 100
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
