; DESCRIPTION: Creates a orange rectangular region at (58, 174) spanning 90 by 46 pixels.
; PLAN: r0=58(x), r1=174(y), r2=90(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 174
LDI r2, 90
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
