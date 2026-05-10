; DESCRIPTION: Creates a orange rectangular region at (28, 132) spanning 61 by 56 pixels.
; PLAN: r0=28(x), r1=132(y), r2=61(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 132
LDI r2, 61
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
