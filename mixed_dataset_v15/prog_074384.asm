; DESCRIPTION: Creates a orange rectangular region at (302, 101) spanning 40 by 82 pixels.
; PLAN: r0=302(x), r1=101(y), r2=40(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 101
LDI r2, 40
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
