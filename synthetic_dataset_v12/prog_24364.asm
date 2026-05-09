; DESCRIPTION: Places a magenta 58x77 rectangle at position (388, 5).
; PLAN: r0=388(x), r1=5(y), r2=58(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 5
LDI r2, 58
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
