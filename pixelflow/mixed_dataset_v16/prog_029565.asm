; DESCRIPTION: Creates a magenta rectangular region at (292, 111) spanning 108 by 25 pixels.
; PLAN: r0=292(x), r1=111(y), r2=108(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 111
LDI r2, 108
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
