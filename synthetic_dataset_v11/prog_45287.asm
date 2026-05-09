; DESCRIPTION: Composite: . Then Renders a black disk with center (167, 141) and radius 71. Then Places a red 71x21 rectangle at position (151, 4).
; PLAN: r0=167(x), r1=141(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=151(x), r1=4(y), r2=71(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (167, 141) and radius 71.
; PLAN: r0=167(x), r1=141(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 141
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 71x21 rectangle at position (151, 4).
; PLAN: r0=151(x), r1=4(y), r2=71(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 4
LDI r2, 71
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
