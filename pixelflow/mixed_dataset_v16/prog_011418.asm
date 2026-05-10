; DESCRIPTION: Creates a orange rectangular region at (102, 94) spanning 27 by 46 pixels.
; PLAN: r0=102(x), r1=94(y), r2=27(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 94
LDI r2, 27
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
