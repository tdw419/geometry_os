; DESCRIPTION: Composite: . Then Renders a cyan box of size 118x104 starting at (78, 118). Then Places a magenta circle of radius 10 at center (84, 234).
; PLAN: r0=78(x), r1=118(y), r2=118(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=84(x), r1=234(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 118x104 starting at (78, 118).
; PLAN: r0=78(x), r1=118(y), r2=118(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 118
LDI r2, 118
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 10 at center (84, 234).
; PLAN: r0=84(x), r1=234(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 234
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
