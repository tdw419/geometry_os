; DESCRIPTION: Creates a orange rectangular region at (108, 202) spanning 76 by 17 pixels.
; PLAN: r0=108(x), r1=202(y), r2=76(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 202
LDI r2, 76
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
