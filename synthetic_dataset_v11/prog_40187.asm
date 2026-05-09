; DESCRIPTION: Composite: . Then Renders a purple box of size 48x58 starting at (84, 81). Then Creates a red circular shape at (207, 48) with radius 33.
; PLAN: r0=84(x), r1=81(y), r2=48(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=207(x), r1=48(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 48x58 starting at (84, 81).
; PLAN: r0=84(x), r1=81(y), r2=48(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 81
LDI r2, 48
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (207, 48) with radius 33.
; PLAN: r0=207(x), r1=48(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 48
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
