; DESCRIPTION: Composite: . Then Places a magenta 82x45 rectangle at position (168, 124). Then Renders a yellow disk with center (112, 123) and radius 62.
; PLAN: r0=168(x), r1=124(y), r2=82(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=112(x), r1=123(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta 82x45 rectangle at position (168, 124).
; PLAN: r0=168(x), r1=124(y), r2=82(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 124
LDI r2, 82
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (112, 123) and radius 62.
; PLAN: r0=112(x), r1=123(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 123
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
