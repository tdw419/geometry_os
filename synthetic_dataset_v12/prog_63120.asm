; DESCRIPTION: Creates a orange rectangular region at (369, 170) spanning 28 by 77 pixels.
; PLAN: r0=369(x), r1=170(y), r2=28(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 170
LDI r2, 28
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
