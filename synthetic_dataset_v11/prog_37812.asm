; DESCRIPTION: Composite: . Then Renders a purple disk with center (77, 55) and radius 52. Then Places a purple 10x41 rectangle at position (166, 187).
; PLAN: r0=77(x), r1=55(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=166(x), r1=187(y), r2=10(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (77, 55) and radius 52.
; PLAN: r0=77(x), r1=55(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 55
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple 10x41 rectangle at position (166, 187).
; PLAN: r0=166(x), r1=187(y), r2=10(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 187
LDI r2, 10
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
