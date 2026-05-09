; DESCRIPTION: Creates a magenta rectangular region at (214, 15) spanning 80 by 97 pixels.
; PLAN: r0=214(x), r1=15(y), r2=80(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 15
LDI r2, 80
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
