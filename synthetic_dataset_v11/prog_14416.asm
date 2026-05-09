; DESCRIPTION: Composite: . Then Places a white circle of radius 69 at center (84, 81). Then Places a red 75x76 rectangle at position (39, 151).
; PLAN: r0=84(x), r1=81(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=39(x), r1=151(y), r2=75(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 69 at center (84, 81).
; PLAN: r0=84(x), r1=81(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 81
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 75x76 rectangle at position (39, 151).
; PLAN: r0=39(x), r1=151(y), r2=75(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 151
LDI r2, 75
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
