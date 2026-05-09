; DESCRIPTION: Creates a magenta rectangular region at (53, 165) spanning 20 by 74 pixels.
; PLAN: r0=53(x), r1=165(y), r2=20(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 165
LDI r2, 20
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
