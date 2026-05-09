; DESCRIPTION: Places a magenta 110x77 rectangle at position (59, 147).
; PLAN: r0=59(x), r1=147(y), r2=110(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 147
LDI r2, 110
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
