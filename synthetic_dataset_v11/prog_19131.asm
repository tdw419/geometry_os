; DESCRIPTION: Composite: . Then Renders a yellow box of size 58x58 starting at (46, 124). Then Creates a magenta circular shape at (80, 93) with radius 19.
; PLAN: r0=46(x), r1=124(y), r2=58(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=80(x), r1=93(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 58x58 starting at (46, 124).
; PLAN: r0=46(x), r1=124(y), r2=58(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 124
LDI r2, 58
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (80, 93) with radius 19.
; PLAN: r0=80(x), r1=93(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 93
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
