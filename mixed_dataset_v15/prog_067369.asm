; DESCRIPTION: Creates a orange rectangular region at (66, 14) spanning 112 by 58 pixels.
; PLAN: r0=66(x), r1=14(y), r2=112(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 14
LDI r2, 112
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
