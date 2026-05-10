; DESCRIPTION: Creates a orange rectangular region at (185, 30) spanning 41 by 59 pixels.
; PLAN: r0=185(x), r1=30(y), r2=41(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 30
LDI r2, 41
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
