; DESCRIPTION: Creates a magenta rectangular region at (344, 15) spanning 29 by 68 pixels.
; PLAN: r0=344(x), r1=15(y), r2=29(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 15
LDI r2, 29
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
