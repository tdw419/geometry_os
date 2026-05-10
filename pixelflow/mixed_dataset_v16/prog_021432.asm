; DESCRIPTION: Places a magenta 11x27 rectangle at position (423, 218).
; PLAN: r0=423(x), r1=218(y), r2=11(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 218
LDI r2, 11
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
