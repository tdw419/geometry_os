; DESCRIPTION: Creates a orange rectangular region at (156, 97) spanning 60 by 30 pixels.
; PLAN: r0=156(x), r1=97(y), r2=60(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 97
LDI r2, 60
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
