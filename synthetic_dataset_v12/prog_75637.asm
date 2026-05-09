; DESCRIPTION: Creates a magenta rectangular region at (306, 180) spanning 74 by 71 pixels.
; PLAN: r0=306(x), r1=180(y), r2=74(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 180
LDI r2, 74
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
