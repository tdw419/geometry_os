; DESCRIPTION: Creates a orange rectangular region at (204, 135) spanning 115 by 71 pixels.
; PLAN: r0=204(x), r1=135(y), r2=115(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 135
LDI r2, 115
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
