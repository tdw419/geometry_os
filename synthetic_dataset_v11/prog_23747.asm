; DESCRIPTION: Composite: . Then Renders a magenta disk with center (63, 101) and radius 62. Then Creates a magenta rectangular region at (112, 89) spanning 97 by 99 pixels.
; PLAN: r0=63(x), r1=101(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=112(x), r1=89(y), r2=97(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (63, 101) and radius 62.
; PLAN: r0=63(x), r1=101(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 101
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (112, 89) spanning 97 by 99 pixels.
; PLAN: r0=112(x), r1=89(y), r2=97(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 89
LDI r2, 97
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
