; DESCRIPTION: Places a magenta 81x77 rectangle at position (117, 39).
; PLAN: r0=117(x), r1=39(y), r2=81(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 39
LDI r2, 81
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
