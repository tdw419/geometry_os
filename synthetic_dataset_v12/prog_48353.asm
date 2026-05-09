; DESCRIPTION: Creates a orange rectangular region at (249, 172) spanning 28 by 35 pixels.
; PLAN: r0=249(x), r1=172(y), r2=28(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 172
LDI r2, 28
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
