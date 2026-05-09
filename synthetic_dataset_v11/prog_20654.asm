; DESCRIPTION: Composite: . Then Renders a yellow box of size 105x88 starting at (25, 3). Then Places a black circle of radius 24 at center (154, 231).
; PLAN: r0=25(x), r1=3(y), r2=105(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=154(x), r1=231(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 105x88 starting at (25, 3).
; PLAN: r0=25(x), r1=3(y), r2=105(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 3
LDI r2, 105
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 24 at center (154, 231).
; PLAN: r0=154(x), r1=231(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 231
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
