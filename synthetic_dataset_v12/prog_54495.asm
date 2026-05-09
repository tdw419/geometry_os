; DESCRIPTION: Places a magenta 59x93 rectangle at position (258, 71).
; PLAN: r0=258(x), r1=71(y), r2=59(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 71
LDI r2, 59
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
