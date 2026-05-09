; DESCRIPTION: Creates a red rectangular region at (377, 145) spanning 88 by 104 pixels.
; PLAN: r0=377(x), r1=145(y), r2=88(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 145
LDI r2, 88
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
