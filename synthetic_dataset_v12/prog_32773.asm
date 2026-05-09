; DESCRIPTION: Creates a magenta rectangular region at (257, 89) spanning 59 by 95 pixels.
; PLAN: r0=257(x), r1=89(y), r2=59(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 89
LDI r2, 59
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
