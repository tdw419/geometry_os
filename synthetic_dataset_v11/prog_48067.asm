; DESCRIPTION: Creates a orange rectangular region at (90, 71) spanning 119 by 113 pixels.
; PLAN: r0=90(x), r1=71(y), r2=119(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 71
LDI r2, 119
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
