; DESCRIPTION: Creates a orange rectangular region at (349, 167) spanning 47 by 71 pixels.
; PLAN: r0=349(x), r1=167(y), r2=47(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 167
LDI r2, 47
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
