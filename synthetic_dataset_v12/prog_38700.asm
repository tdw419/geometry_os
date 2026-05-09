; DESCRIPTION: Creates a yellow rectangular region at (344, 85) spanning 117 by 59 pixels.
; PLAN: r0=344(x), r1=85(y), r2=117(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 85
LDI r2, 117
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
