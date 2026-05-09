; DESCRIPTION: Creates a orange rectangular region at (96, 152) spanning 34 by 97 pixels.
; PLAN: r0=96(x), r1=152(y), r2=34(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 152
LDI r2, 34
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
