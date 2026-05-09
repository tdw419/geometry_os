; DESCRIPTION: Creates a orange rectangular region at (105, 1) spanning 82 by 107 pixels.
; PLAN: r0=105(x), r1=1(y), r2=82(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 1
LDI r2, 82
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
