; DESCRIPTION: Composite: . Then Renders a yellow disk with center (221, 188) and radius 29. Then Creates a orange rectangular region at (191, 132) spanning 62 by 89 pixels.
; PLAN: r0=221(x), r1=188(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=191(x), r1=132(y), r2=62(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (221, 188) and radius 29.
; PLAN: r0=221(x), r1=188(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 188
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a orange rectangular region at (191, 132) spanning 62 by 89 pixels.
; PLAN: r0=191(x), r1=132(y), r2=62(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 132
LDI r2, 62
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
