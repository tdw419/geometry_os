; DESCRIPTION: Creates a orange rectangular region at (58, 178) spanning 28 by 21 pixels.
; PLAN: r0=58(x), r1=178(y), r2=28(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 178
LDI r2, 28
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
