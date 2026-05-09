; DESCRIPTION: Creates a orange rectangular region at (243, 41) spanning 12 by 35 pixels.
; PLAN: r0=243(x), r1=41(y), r2=12(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 41
LDI r2, 12
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
