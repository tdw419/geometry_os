; DESCRIPTION: Creates a orange rectangular region at (112, 19) spanning 30 by 65 pixels.
; PLAN: r0=112(x), r1=19(y), r2=30(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 19
LDI r2, 30
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
