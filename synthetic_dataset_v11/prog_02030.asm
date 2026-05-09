; DESCRIPTION: Composite: . Then Places a green dot at position (53, 71). Then Creates a blue rectangular region at (169, 99) spanning 85 by 108 pixels.
; PLAN: r0=53(x), r1=71(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=169(x), r1=99(y), r2=85(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (53, 71).
; PLAN: r0=53(x), r1=71(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 71
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (169, 99) spanning 85 by 108 pixels.
; PLAN: r0=169(x), r1=99(y), r2=85(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 99
LDI r2, 85
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
