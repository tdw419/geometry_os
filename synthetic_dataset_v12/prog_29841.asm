; DESCRIPTION: Creates a orange rectangular region at (128, 136) spanning 54 by 99 pixels.
; PLAN: r0=128(x), r1=136(y), r2=54(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 136
LDI r2, 54
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
