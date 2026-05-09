; DESCRIPTION: Composite: . Then Renders a magenta box of size 93x111 starting at (77, 0). Then Creates a yellow circular shape at (107, 159) with radius 73.
; PLAN: r0=77(x), r1=0(y), r2=93(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=107(x), r1=159(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 93x111 starting at (77, 0).
; PLAN: r0=77(x), r1=0(y), r2=93(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 0
LDI r2, 93
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (107, 159) with radius 73.
; PLAN: r0=107(x), r1=159(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 159
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
