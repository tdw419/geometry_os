; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (6, 61) spanning 63 by 37 pixels. Then Places a yellow circle of radius 68 at center (93, 108).
; PLAN: r0=6(x), r1=61(y), r2=63(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=93(x), r1=108(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (6, 61) spanning 63 by 37 pixels.
; PLAN: r0=6(x), r1=61(y), r2=63(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 61
LDI r2, 63
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 68 at center (93, 108).
; PLAN: r0=93(x), r1=108(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 108
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
