; DESCRIPTION: Creates a magenta rectangular region at (74, 78) spanning 113 by 93 pixels.
; PLAN: r0=74(x), r1=78(y), r2=113(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 78
LDI r2, 113
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
