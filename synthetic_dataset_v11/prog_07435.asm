; DESCRIPTION: Composite: . Then Creates a blue circular shape at (111, 76) with radius 61. Then Renders a cyan box of size 75x58 starting at (106, 20).
; PLAN: r0=111(x), r1=76(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=106(x), r1=20(y), r2=75(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (111, 76) with radius 61.
; PLAN: r0=111(x), r1=76(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 76
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan box of size 75x58 starting at (106, 20).
; PLAN: r0=106(x), r1=20(y), r2=75(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 20
LDI r2, 75
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
