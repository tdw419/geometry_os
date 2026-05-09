; DESCRIPTION: Creates a orange rectangular region at (186, 102) spanning 35 by 95 pixels.
; PLAN: r0=186(x), r1=102(y), r2=35(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 102
LDI r2, 35
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
