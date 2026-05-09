; DESCRIPTION: Places a magenta 17x93 rectangle at position (372, 131).
; PLAN: r0=372(x), r1=131(y), r2=17(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 131
LDI r2, 17
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
