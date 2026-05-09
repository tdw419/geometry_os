; DESCRIPTION: Places a magenta 49x23 rectangle at position (30, 193).
; PLAN: r0=30(x), r1=193(y), r2=49(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 193
LDI r2, 49
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
