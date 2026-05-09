; DESCRIPTION: Places a magenta 120x112 rectangle at position (53, 70).
; PLAN: r0=53(x), r1=70(y), r2=120(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 70
LDI r2, 120
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
