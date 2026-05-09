; DESCRIPTION: Places a magenta 21x77 rectangle at position (96, 1).
; PLAN: r0=96(x), r1=1(y), r2=21(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 1
LDI r2, 21
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
