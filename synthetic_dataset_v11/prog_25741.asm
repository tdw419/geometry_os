; DESCRIPTION: Creates a orange rectangular region at (217, 138) spanning 23 by 16 pixels.
; PLAN: r0=217(x), r1=138(y), r2=23(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 138
LDI r2, 23
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
