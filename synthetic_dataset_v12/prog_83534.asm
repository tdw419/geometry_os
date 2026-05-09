; DESCRIPTION: Creates a magenta rectangular region at (413, 79) spanning 52 by 37 pixels.
; PLAN: r0=413(x), r1=79(y), r2=52(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 79
LDI r2, 52
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
