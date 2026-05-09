; DESCRIPTION: Composite: . Then Places a yellow circle of radius 62 at center (157, 79). Then Places a magenta 90x66 rectangle at position (71, 140).
; PLAN: r0=157(x), r1=79(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=71(x), r1=140(y), r2=90(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 62 at center (157, 79).
; PLAN: r0=157(x), r1=79(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 79
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta 90x66 rectangle at position (71, 140).
; PLAN: r0=71(x), r1=140(y), r2=90(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 140
LDI r2, 90
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
