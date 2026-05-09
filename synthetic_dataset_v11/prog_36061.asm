; DESCRIPTION: Composite: . Then Places a red 118x116 rectangle at position (31, 80). Then Places a magenta circle of radius 76 at center (134, 88).
; PLAN: r0=31(x), r1=80(y), r2=118(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=134(x), r1=88(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 118x116 rectangle at position (31, 80).
; PLAN: r0=31(x), r1=80(y), r2=118(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 80
LDI r2, 118
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 76 at center (134, 88).
; PLAN: r0=134(x), r1=88(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 88
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
