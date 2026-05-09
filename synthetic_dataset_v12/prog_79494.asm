; DESCRIPTION: Creates a magenta rectangular region at (22, 117) spanning 19 by 104 pixels.
; PLAN: r0=22(x), r1=117(y), r2=19(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 117
LDI r2, 19
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
