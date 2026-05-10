; DESCRIPTION: Creates a magenta rectangular region at (401, 97) spanning 71 by 11 pixels.
; PLAN: r0=401(x), r1=97(y), r2=71(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 97
LDI r2, 71
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
