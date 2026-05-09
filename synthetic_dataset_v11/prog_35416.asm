; DESCRIPTION: Composite: . Then Places a red circle of radius 73 at center (168, 151). Then Places a yellow 26x74 rectangle at position (4, 168).
; PLAN: r0=168(x), r1=151(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=4(x), r1=168(y), r2=26(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 73 at center (168, 151).
; PLAN: r0=168(x), r1=151(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 151
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 26x74 rectangle at position (4, 168).
; PLAN: r0=4(x), r1=168(y), r2=26(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 168
LDI r2, 26
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
