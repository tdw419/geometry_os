; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (6, 93) spanning 50 by 94 pixels. Then Places a orange circle of radius 56 at center (81, 118).
; PLAN: r0=6(x), r1=93(y), r2=50(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=81(x), r1=118(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (6, 93) spanning 50 by 94 pixels.
; PLAN: r0=6(x), r1=93(y), r2=50(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 93
LDI r2, 50
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 56 at center (81, 118).
; PLAN: r0=81(x), r1=118(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 118
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
