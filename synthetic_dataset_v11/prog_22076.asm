; DESCRIPTION: Composite: . Then Renders a red disk with center (136, 135) and radius 76. Then Places a red 28x103 rectangle at position (159, 76).
; PLAN: r0=136(x), r1=135(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=159(x), r1=76(y), r2=28(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (136, 135) and radius 76.
; PLAN: r0=136(x), r1=135(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 135
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 28x103 rectangle at position (159, 76).
; PLAN: r0=159(x), r1=76(y), r2=28(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 76
LDI r2, 28
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
