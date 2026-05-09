; DESCRIPTION: Composite: . Then Renders a blue box of size 91x85 starting at (59, 164). Then Creates a yellow circular shape at (185, 91) with radius 24.
; PLAN: r0=59(x), r1=164(y), r2=91(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=185(x), r1=91(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 91x85 starting at (59, 164).
; PLAN: r0=59(x), r1=164(y), r2=91(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 164
LDI r2, 91
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (185, 91) with radius 24.
; PLAN: r0=185(x), r1=91(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 91
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
