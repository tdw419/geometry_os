; DESCRIPTION: Places a magenta 74x37 rectangle at position (178, 76).
; PLAN: r0=178(x), r1=76(y), r2=74(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 76
LDI r2, 74
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
