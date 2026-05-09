; DESCRIPTION: Creates a magenta rectangular region at (60, 91) spanning 91 by 71 pixels.
; PLAN: r0=60(x), r1=91(y), r2=91(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 91
LDI r2, 91
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
