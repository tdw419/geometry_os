; DESCRIPTION: Creates a orange rectangular region at (89, 81) spanning 71 by 28 pixels.
; PLAN: r0=89(x), r1=81(y), r2=71(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 81
LDI r2, 71
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
