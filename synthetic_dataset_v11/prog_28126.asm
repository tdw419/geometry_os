; DESCRIPTION: Composite: . Then Renders a white box of size 109x91 starting at (79, 140). Then Places a purple circle of radius 14 at center (189, 219).
; PLAN: r0=79(x), r1=140(y), r2=109(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=189(x), r1=219(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white box of size 109x91 starting at (79, 140).
; PLAN: r0=79(x), r1=140(y), r2=109(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 140
LDI r2, 109
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 14 at center (189, 219).
; PLAN: r0=189(x), r1=219(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 219
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
