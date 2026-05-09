; DESCRIPTION: Creates a magenta rectangular region at (344, 70) spanning 57 by 78 pixels.
; PLAN: r0=344(x), r1=70(y), r2=57(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 70
LDI r2, 57
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
