; DESCRIPTION: Composite: . Then Renders a green disk with center (216, 191) and radius 15. Then Places a red 81x57 rectangle at position (103, 120).
; PLAN: r0=216(x), r1=191(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=103(x), r1=120(y), r2=81(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (216, 191) and radius 15.
; PLAN: r0=216(x), r1=191(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 191
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 81x57 rectangle at position (103, 120).
; PLAN: r0=103(x), r1=120(y), r2=81(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 120
LDI r2, 81
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
