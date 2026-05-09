; DESCRIPTION: Creates a orange rectangular region at (71, 159) spanning 95 by 74 pixels.
; PLAN: r0=71(x), r1=159(y), r2=95(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 159
LDI r2, 95
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
