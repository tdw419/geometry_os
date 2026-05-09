; DESCRIPTION: Creates a white rectangular region at (125, 69) spanning 33 by 99 pixels.
; PLAN: r0=125(x), r1=69(y), r2=33(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 69
LDI r2, 33
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
