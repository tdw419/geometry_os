; DESCRIPTION: Creates a magenta rectangular region at (405, 64) spanning 19 by 36 pixels.
; PLAN: r0=405(x), r1=64(y), r2=19(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 64
LDI r2, 19
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
