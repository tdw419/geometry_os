; DESCRIPTION: Creates a orange rectangular region at (142, 79) spanning 96 by 37 pixels.
; PLAN: r0=142(x), r1=79(y), r2=96(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 79
LDI r2, 96
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
