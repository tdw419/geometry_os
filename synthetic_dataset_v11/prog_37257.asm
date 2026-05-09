; DESCRIPTION: Creates a orange rectangular region at (96, 120) spanning 45 by 41 pixels.
; PLAN: r0=96(x), r1=120(y), r2=45(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 120
LDI r2, 45
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
