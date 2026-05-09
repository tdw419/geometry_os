; DESCRIPTION: Creates a orange rectangular region at (137, 198) spanning 67 by 38 pixels.
; PLAN: r0=137(x), r1=198(y), r2=67(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 198
LDI r2, 67
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
