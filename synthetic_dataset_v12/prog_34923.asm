; DESCRIPTION: Creates a orange rectangular region at (242, 41) spanning 43 by 85 pixels.
; PLAN: r0=242(x), r1=41(y), r2=43(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 41
LDI r2, 43
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
