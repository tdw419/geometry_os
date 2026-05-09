; DESCRIPTION: Creates a orange rectangular region at (123, 40) spanning 98 by 40 pixels.
; PLAN: r0=123(x), r1=40(y), r2=98(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 40
LDI r2, 98
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
