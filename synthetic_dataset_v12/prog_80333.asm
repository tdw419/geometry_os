; DESCRIPTION: Creates a magenta rectangular region at (151, 130) spanning 101 by 117 pixels.
; PLAN: r0=151(x), r1=130(y), r2=101(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 130
LDI r2, 101
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
