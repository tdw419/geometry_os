; DESCRIPTION: Creates a magenta rectangular region at (1, 163) spanning 107 by 72 pixels.
; PLAN: r0=1(x), r1=163(y), r2=107(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 163
LDI r2, 107
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
