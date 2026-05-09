; DESCRIPTION: Composite: . Then Renders a purple disk with center (32, 101) and radius 21. Then Places a orange 33x77 rectangle at position (78, 12).
; PLAN: r0=32(x), r1=101(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=78(x), r1=12(y), r2=33(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (32, 101) and radius 21.
; PLAN: r0=32(x), r1=101(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 101
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 33x77 rectangle at position (78, 12).
; PLAN: r0=78(x), r1=12(y), r2=33(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 12
LDI r2, 33
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
