; DESCRIPTION: Places a magenta 32x19 rectangle at position (276, 162).
; PLAN: r0=276(x), r1=162(y), r2=32(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 162
LDI r2, 32
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
