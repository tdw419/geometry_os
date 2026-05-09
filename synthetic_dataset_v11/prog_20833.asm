; DESCRIPTION: Creates a magenta rectangular region at (35, 29) spanning 113 by 98 pixels.
; PLAN: r0=35(x), r1=29(y), r2=113(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 29
LDI r2, 113
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
