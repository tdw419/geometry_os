; DESCRIPTION: Creates a magenta rectangular region at (167, 52) spanning 74 by 18 pixels.
; PLAN: r0=167(x), r1=52(y), r2=74(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 52
LDI r2, 74
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
