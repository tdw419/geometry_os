; DESCRIPTION: Creates a magenta rectangular region at (153, 98) spanning 74 by 30 pixels.
; PLAN: r0=153(x), r1=98(y), r2=74(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 98
LDI r2, 74
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
