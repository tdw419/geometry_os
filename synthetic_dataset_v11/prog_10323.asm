; DESCRIPTION: Composite: . Then Places a orange circle of radius 47 at center (204, 87). Then Creates a yellow rectangular region at (93, 145) spanning 94 by 100 pixels.
; PLAN: r0=204(x), r1=87(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=93(x), r1=145(y), r2=94(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 47 at center (204, 87).
; PLAN: r0=204(x), r1=87(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 87
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a yellow rectangular region at (93, 145) spanning 94 by 100 pixels.
; PLAN: r0=93(x), r1=145(y), r2=94(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 145
LDI r2, 94
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
