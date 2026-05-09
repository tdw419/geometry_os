; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (94, 123) with radius 21. Then Renders a yellow box of size 85x110 starting at (26, 67).
; PLAN: r0=94(x), r1=123(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=26(x), r1=67(y), r2=85(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (94, 123) with radius 21.
; PLAN: r0=94(x), r1=123(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 123
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow box of size 85x110 starting at (26, 67).
; PLAN: r0=26(x), r1=67(y), r2=85(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 67
LDI r2, 85
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
