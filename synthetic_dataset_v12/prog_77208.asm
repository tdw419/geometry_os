; DESCRIPTION: Places a magenta 13x99 rectangle at position (64, 45).
; PLAN: r0=64(x), r1=45(y), r2=13(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 45
LDI r2, 13
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
