; DESCRIPTION: Creates a orange rectangular region at (56, 162) spanning 117 by 11 pixels.
; PLAN: r0=56(x), r1=162(y), r2=117(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 162
LDI r2, 117
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
