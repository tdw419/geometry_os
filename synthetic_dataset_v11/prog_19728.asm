; DESCRIPTION: Places a magenta 105x32 rectangle at position (71, 135).
; PLAN: r0=71(x), r1=135(y), r2=105(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 135
LDI r2, 105
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
