; DESCRIPTION: Composite: . Then Creates a red circular shape at (99, 160) with radius 72. Then Places a black 94x118 rectangle at position (114, 71).
; PLAN: r0=99(x), r1=160(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=114(x), r1=71(y), r2=94(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (99, 160) with radius 72.
; PLAN: r0=99(x), r1=160(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 160
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 94x118 rectangle at position (114, 71).
; PLAN: r0=114(x), r1=71(y), r2=94(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 71
LDI r2, 94
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
