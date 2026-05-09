; DESCRIPTION: Creates a yellow rectangular region at (406, 21) spanning 79 by 67 pixels.
; PLAN: r0=406(x), r1=21(y), r2=79(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 21
LDI r2, 79
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
