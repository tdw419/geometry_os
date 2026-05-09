; DESCRIPTION: Places a magenta 40x57 rectangle at position (64, 39).
; PLAN: r0=64(x), r1=39(y), r2=40(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 39
LDI r2, 40
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
