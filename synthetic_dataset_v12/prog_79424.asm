; DESCRIPTION: Places a magenta 31x77 rectangle at position (2, 62).
; PLAN: r0=2(x), r1=62(y), r2=31(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 62
LDI r2, 31
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
