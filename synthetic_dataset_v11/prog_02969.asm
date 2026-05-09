; DESCRIPTION: Places a magenta 77x70 rectangle at position (170, 77).
; PLAN: r0=170(x), r1=77(y), r2=77(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 77
LDI r2, 77
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
