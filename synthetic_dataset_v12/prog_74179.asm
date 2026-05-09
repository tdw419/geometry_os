; DESCRIPTION: Creates a yellow rectangular region at (165, 108) spanning 18 by 67 pixels.
; PLAN: r0=165(x), r1=108(y), r2=18(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 108
LDI r2, 18
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
