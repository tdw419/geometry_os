; DESCRIPTION: Creates a orange rectangular region at (231, 138) spanning 19 by 65 pixels.
; PLAN: r0=231(x), r1=138(y), r2=19(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 138
LDI r2, 19
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
