; DESCRIPTION: Places a magenta 70x107 rectangle at position (382, 22).
; PLAN: r0=382(x), r1=22(y), r2=70(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 22
LDI r2, 70
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
