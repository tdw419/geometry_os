; DESCRIPTION: Creates a magenta rectangular region at (306, 84) spanning 96 by 104 pixels.
; PLAN: r0=306(x), r1=84(y), r2=96(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 84
LDI r2, 96
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
