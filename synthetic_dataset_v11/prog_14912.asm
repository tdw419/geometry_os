; DESCRIPTION: Places a magenta 14x102 rectangle at position (19, 124).
; PLAN: r0=19(x), r1=124(y), r2=14(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 124
LDI r2, 14
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
