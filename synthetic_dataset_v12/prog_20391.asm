; DESCRIPTION: Creates a orange rectangular region at (64, 18) spanning 29 by 58 pixels.
; PLAN: r0=64(x), r1=18(y), r2=29(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 18
LDI r2, 29
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
