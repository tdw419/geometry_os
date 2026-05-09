; DESCRIPTION: Creates a magenta rectangular region at (140, 130) spanning 76 by 54 pixels.
; PLAN: r0=140(x), r1=130(y), r2=76(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 130
LDI r2, 76
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
