; DESCRIPTION: Composite: . Then Renders a purple disk with center (170, 170) and radius 35. Then Places a orange 30x27 rectangle at position (4, 174).
; PLAN: r0=170(x), r1=170(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=4(x), r1=174(y), r2=30(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (170, 170) and radius 35.
; PLAN: r0=170(x), r1=170(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 170
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 30x27 rectangle at position (4, 174).
; PLAN: r0=4(x), r1=174(y), r2=30(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 174
LDI r2, 30
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
