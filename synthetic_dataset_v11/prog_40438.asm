; DESCRIPTION: Composite: . Then Renders a blue disk with center (133, 107) and radius 59. Then Places a orange 71x19 rectangle at position (41, 137).
; PLAN: r0=133(x), r1=107(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=41(x), r1=137(y), r2=71(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (133, 107) and radius 59.
; PLAN: r0=133(x), r1=107(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 107
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 71x19 rectangle at position (41, 137).
; PLAN: r0=41(x), r1=137(y), r2=71(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 137
LDI r2, 71
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
