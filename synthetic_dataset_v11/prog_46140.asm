; DESCRIPTION: Composite: . Then Renders a red box of size 107x42 starting at (41, 140). Then Places a purple circle of radius 48 at center (176, 129).
; PLAN: r0=41(x), r1=140(y), r2=107(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x), r1=129(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 107x42 starting at (41, 140).
; PLAN: r0=41(x), r1=140(y), r2=107(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 140
LDI r2, 107
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 48 at center (176, 129).
; PLAN: r0=176(x), r1=129(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 129
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
