; DESCRIPTION: Creates a orange rectangular region at (340, 66) spanning 116 by 94 pixels.
; PLAN: r0=340(x), r1=66(y), r2=116(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 66
LDI r2, 116
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
