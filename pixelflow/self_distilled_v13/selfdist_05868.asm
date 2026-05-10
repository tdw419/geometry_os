; DESCRIPTION: Creates a magenta filled rectangle of size 75x69 starting at (123, 38).
; PLAN: r0=123(x), r1=38(y), r2=75(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 38
LDI r2, 75
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
