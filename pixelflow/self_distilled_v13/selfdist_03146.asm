; DESCRIPTION: Creates a magenta filled rectangle of size 57x60 starting at (371, 36).
; PLAN: r0=371(x), r1=36(y), r2=57(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 36
LDI r2, 57
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
