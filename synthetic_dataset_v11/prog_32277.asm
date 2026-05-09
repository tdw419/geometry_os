; DESCRIPTION: Creates a orange rectangular region at (123, 138) spanning 107 by 98 pixels.
; PLAN: r0=123(x), r1=138(y), r2=107(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 138
LDI r2, 107
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
