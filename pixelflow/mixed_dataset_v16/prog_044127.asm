; DESCRIPTION: Creates a orange rectangular region at (281, 63) spanning 66 by 31 pixels.
; PLAN: r0=281(x), r1=63(y), r2=66(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 63
LDI r2, 66
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
