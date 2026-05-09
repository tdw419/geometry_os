; DESCRIPTION: Creates a magenta rectangular region at (182, 134) spanning 71 by 117 pixels.
; PLAN: r0=182(x), r1=134(y), r2=71(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 134
LDI r2, 71
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
