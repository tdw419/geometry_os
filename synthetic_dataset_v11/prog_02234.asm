; DESCRIPTION: Composite: . Then Places a orange 13x58 rectangle at position (191, 194). Then Renders a magenta disk with center (112, 155) and radius 48.
; PLAN: r0=191(x), r1=194(y), r2=13(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=112(x), r1=155(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 13x58 rectangle at position (191, 194).
; PLAN: r0=191(x), r1=194(y), r2=13(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 194
LDI r2, 13
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (112, 155) and radius 48.
; PLAN: r0=112(x), r1=155(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 155
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
