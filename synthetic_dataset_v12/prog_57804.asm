; DESCRIPTION: Creates a orange rectangular region at (430, 107) spanning 35 by 56 pixels.
; PLAN: r0=430(x), r1=107(y), r2=35(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 107
LDI r2, 35
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
