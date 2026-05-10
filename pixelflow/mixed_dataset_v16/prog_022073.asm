; DESCRIPTION: Creates a magenta filled rectangle of size 21x83 starting at (108, 116).
; PLAN: r0=108(x), r1=116(y), r2=21(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 116
LDI r2, 21
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
