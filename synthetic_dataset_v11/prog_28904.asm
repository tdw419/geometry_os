; DESCRIPTION: Creates a magenta rectangular region at (33, 130) spanning 74 by 44 pixels.
; PLAN: r0=33(x), r1=130(y), r2=74(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 130
LDI r2, 74
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
