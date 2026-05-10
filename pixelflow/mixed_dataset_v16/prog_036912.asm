; DESCRIPTION: Places a magenta 11x10 rectangle at position (272, 53).
; PLAN: r0=272(x), r1=53(y), r2=11(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 53
LDI r2, 11
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
