; DESCRIPTION: Creates a magenta rectangular region at (120, 98) spanning 72 by 102 pixels.
; PLAN: r0=120(x), r1=98(y), r2=72(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 98
LDI r2, 72
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
