; DESCRIPTION: Creates a orange rectangular region at (204, 117) spanning 18 by 98 pixels.
; PLAN: r0=204(x), r1=117(y), r2=18(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 117
LDI r2, 18
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
