; DESCRIPTION: Creates a yellow rectangular region at (123, 185) spanning 16 by 67 pixels.
; PLAN: r0=123(x), r1=185(y), r2=16(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 185
LDI r2, 16
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
