; DESCRIPTION: Places a magenta 71x35 rectangle at position (360, 151).
; PLAN: r0=360(x), r1=151(y), r2=71(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 151
LDI r2, 71
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
