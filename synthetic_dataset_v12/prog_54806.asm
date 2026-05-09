; DESCRIPTION: Creates a magenta rectangular region at (104, 122) spanning 70 by 19 pixels.
; PLAN: r0=104(x), r1=122(y), r2=70(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 122
LDI r2, 70
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
