; DESCRIPTION: Creates a orange rectangular region at (465, 171) spanning 23 by 22 pixels.
; PLAN: r0=465(x), r1=171(y), r2=23(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 171
LDI r2, 23
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
