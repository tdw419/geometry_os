; DESCRIPTION: Creates a yellow rectangular region at (291, 56) spanning 38 by 68 pixels.
; PLAN: r0=291(x), r1=56(y), r2=38(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 56
LDI r2, 38
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
