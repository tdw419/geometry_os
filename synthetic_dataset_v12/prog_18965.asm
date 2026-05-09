; DESCRIPTION: Places a magenta 74x11 rectangle at position (117, 31).
; PLAN: r0=117(x), r1=31(y), r2=74(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 31
LDI r2, 74
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
