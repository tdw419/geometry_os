; DESCRIPTION: Composite: . Then Places a purple circle of radius 30 at center (225, 140). Then Places a white 115x27 rectangle at position (64, 161).
; PLAN: r0=225(x), r1=140(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=64(x), r1=161(y), r2=115(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 30 at center (225, 140).
; PLAN: r0=225(x), r1=140(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 140
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white 115x27 rectangle at position (64, 161).
; PLAN: r0=64(x), r1=161(y), r2=115(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 161
LDI r2, 115
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
