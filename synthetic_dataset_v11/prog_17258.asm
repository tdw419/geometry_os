; DESCRIPTION: Creates a yellow rectangular region at (20, 149) spanning 67 by 72 pixels.
; PLAN: r0=20(x), r1=149(y), r2=67(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 149
LDI r2, 67
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
