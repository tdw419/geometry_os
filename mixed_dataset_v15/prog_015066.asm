; DESCRIPTION: Places a magenta 50x93 rectangle at position (409, 0).
; PLAN: r0=409(x), r1=0(y), r2=50(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 0
LDI r2, 50
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
