; DESCRIPTION: Creates a magenta rectangular region at (142, 28) spanning 27 by 76 pixels.
; PLAN: r0=142(x), r1=28(y), r2=27(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 28
LDI r2, 27
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
