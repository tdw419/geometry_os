; DESCRIPTION: Composite: . Then Places a green line segment connecting (19, 42) to (157, 59). Then Creates a white circular shape at (136, 183) with radius 62.
; PLAN: r0=19(x1), r1=42(y1), r2=157(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=136(x), r1=183(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (19, 42) to (157, 59).
; PLAN: r0=19(x1), r1=42(y1), r2=157(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 42
LDI r2, 157
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (136, 183) with radius 62.
; PLAN: r0=136(x), r1=183(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 183
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
