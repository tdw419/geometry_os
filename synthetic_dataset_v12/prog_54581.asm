; DESCRIPTION: Creates a magenta rectangular region at (452, 180) spanning 10 by 72 pixels.
; PLAN: r0=452(x), r1=180(y), r2=10(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 180
LDI r2, 10
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
