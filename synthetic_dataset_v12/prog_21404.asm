; DESCRIPTION: Creates a magenta rectangular region at (356, 52) spanning 20 by 46 pixels.
; PLAN: r0=356(x), r1=52(y), r2=20(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 52
LDI r2, 20
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
