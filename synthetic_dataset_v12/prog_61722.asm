; DESCRIPTION: Creates a magenta rectangular region at (466, 33) spanning 29 by 117 pixels.
; PLAN: r0=466(x), r1=33(y), r2=29(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 33
LDI r2, 29
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
