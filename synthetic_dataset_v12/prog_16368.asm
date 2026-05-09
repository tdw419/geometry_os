; DESCRIPTION: Places a magenta 95x77 rectangle at position (14, 61).
; PLAN: r0=14(x), r1=61(y), r2=95(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 61
LDI r2, 95
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
