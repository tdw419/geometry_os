; DESCRIPTION: Creates a magenta rectangular region at (238, 114) spanning 27 by 112 pixels.
; PLAN: r0=238(x), r1=114(y), r2=27(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 114
LDI r2, 27
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
