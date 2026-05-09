; DESCRIPTION: Creates a orange rectangular region at (184, 202) spanning 46 by 33 pixels.
; PLAN: r0=184(x), r1=202(y), r2=46(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 202
LDI r2, 46
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
