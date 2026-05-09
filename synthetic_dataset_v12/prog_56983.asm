; DESCRIPTION: Creates a yellow rectangular region at (344, 149) spanning 83 by 67 pixels.
; PLAN: r0=344(x), r1=149(y), r2=83(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 149
LDI r2, 83
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
