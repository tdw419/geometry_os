; DESCRIPTION: Creates a magenta rectangular region at (53, 165) spanning 90 by 27 pixels.
; PLAN: r0=53(x), r1=165(y), r2=90(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 165
LDI r2, 90
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
