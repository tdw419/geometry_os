; DESCRIPTION: Places a blue 42x26 rectangle at position (134, 92).
; PLAN: r0=134(x), r1=92(y), r2=42(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 92
LDI r2, 42
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
