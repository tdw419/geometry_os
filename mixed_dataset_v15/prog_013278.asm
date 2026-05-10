; DESCRIPTION: Creates a magenta filled rectangle of size 54x32 starting at (236, 120).
; PLAN: r0=236(x), r1=120(y), r2=54(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 120
LDI r2, 54
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
