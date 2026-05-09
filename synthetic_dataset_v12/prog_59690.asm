; DESCRIPTION: Creates a orange rectangular region at (354, 112) spanning 26 by 106 pixels.
; PLAN: r0=354(x), r1=112(y), r2=26(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 112
LDI r2, 26
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
