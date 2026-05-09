; DESCRIPTION: Composite: . Then Renders a yellow box of size 89x34 starting at (102, 17). Then Creates a magenta circular shape at (87, 105) with radius 61.
; PLAN: r0=102(x), r1=17(y), r2=89(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=87(x), r1=105(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 89x34 starting at (102, 17).
; PLAN: r0=102(x), r1=17(y), r2=89(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 17
LDI r2, 89
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (87, 105) with radius 61.
; PLAN: r0=87(x), r1=105(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 105
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
