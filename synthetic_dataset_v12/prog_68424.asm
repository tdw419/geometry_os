; DESCRIPTION: Creates a red rectangular region at (70, 84) spanning 54 by 73 pixels.
; PLAN: r0=70(x), r1=84(y), r2=54(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 84
LDI r2, 54
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
