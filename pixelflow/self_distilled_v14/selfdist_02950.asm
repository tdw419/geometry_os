; DESCRIPTION: Creates a magenta filled rectangle of size 16x84 starting at (128, 135).
; PLAN: r0=128(x), r1=135(y), r2=16(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 135
LDI r2, 16
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
