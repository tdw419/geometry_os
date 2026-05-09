; DESCRIPTION: Places a magenta 77x64 rectangle at position (76, 31).
; PLAN: r0=76(x), r1=31(y), r2=77(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 31
LDI r2, 77
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
