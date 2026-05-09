; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (89, 122) spanning 78 by 76 pixels. Then Renders a yellow disk with center (202, 204) and radius 50.
; PLAN: r0=89(x), r1=122(y), r2=78(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=202(x), r1=204(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (89, 122) spanning 78 by 76 pixels.
; PLAN: r0=89(x), r1=122(y), r2=78(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 122
LDI r2, 78
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (202, 204) and radius 50.
; PLAN: r0=202(x), r1=204(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 204
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
