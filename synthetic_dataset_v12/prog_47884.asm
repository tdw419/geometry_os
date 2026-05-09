; DESCRIPTION: Creates a magenta rectangular region at (48, 116) spanning 91 by 107 pixels.
; PLAN: r0=48(x), r1=116(y), r2=91(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 116
LDI r2, 91
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
