; DESCRIPTION: Places a magenta 68x112 rectangle at position (24, 70).
; PLAN: r0=24(x), r1=70(y), r2=68(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 70
LDI r2, 68
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
