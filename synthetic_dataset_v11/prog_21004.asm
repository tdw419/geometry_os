; DESCRIPTION: Creates a orange rectangular region at (183, 138) spanning 57 by 70 pixels.
; PLAN: r0=183(x), r1=138(y), r2=57(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 138
LDI r2, 57
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
