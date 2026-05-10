; DESCRIPTION: Creates a magenta filled rectangle of size 108x70 starting at (29, 182).
; PLAN: r0=29(x), r1=182(y), r2=108(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 182
LDI r2, 108
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
