; DESCRIPTION: Creates a orange rectangular region at (61, 6) spanning 102 by 90 pixels.
; PLAN: r0=61(x), r1=6(y), r2=102(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 6
LDI r2, 102
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
