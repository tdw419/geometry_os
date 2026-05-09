; DESCRIPTION: Places a magenta 11x66 rectangle at position (124, 184).
; PLAN: r0=124(x), r1=184(y), r2=11(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 184
LDI r2, 11
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
