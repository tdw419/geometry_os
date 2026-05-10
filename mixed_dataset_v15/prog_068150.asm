; DESCRIPTION: Creates a orange rectangular region at (408, 23) spanning 25 by 115 pixels.
; PLAN: r0=408(x), r1=23(y), r2=25(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 23
LDI r2, 25
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
