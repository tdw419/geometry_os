; DESCRIPTION: Places a magenta 84x57 rectangle at position (49, 161).
; PLAN: r0=49(x), r1=161(y), r2=84(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 161
LDI r2, 84
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
