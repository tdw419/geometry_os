; DESCRIPTION: Creates a magenta filled rectangle of size 40x32 starting at (176, 198).
; PLAN: r0=176(x), r1=198(y), r2=40(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 198
LDI r2, 40
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
