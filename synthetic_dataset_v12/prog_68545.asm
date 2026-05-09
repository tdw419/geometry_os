; DESCRIPTION: Creates a orange rectangular region at (174, 40) spanning 66 by 70 pixels.
; PLAN: r0=174(x), r1=40(y), r2=66(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 40
LDI r2, 66
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
