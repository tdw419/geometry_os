; DESCRIPTION: Places a magenta 89x77 rectangle at position (324, 176).
; PLAN: r0=324(x), r1=176(y), r2=89(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 176
LDI r2, 89
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
