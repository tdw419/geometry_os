; DESCRIPTION: Creates a magenta rectangular region at (2, 112) spanning 107 by 76 pixels.
; PLAN: r0=2(x), r1=112(y), r2=107(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 112
LDI r2, 107
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
