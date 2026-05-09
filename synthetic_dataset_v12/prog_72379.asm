; DESCRIPTION: Creates a orange rectangular region at (288, 128) spanning 19 by 112 pixels.
; PLAN: r0=288(x), r1=128(y), r2=19(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 128
LDI r2, 19
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
