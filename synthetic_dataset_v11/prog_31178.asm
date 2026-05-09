; DESCRIPTION: Places a magenta 77x56 rectangle at position (112, 9).
; PLAN: r0=112(x), r1=9(y), r2=77(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 9
LDI r2, 77
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
