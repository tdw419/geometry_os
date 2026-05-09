; DESCRIPTION: Creates a white rectangular region at (39, 1) spanning 69 by 79 pixels.
; PLAN: r0=39(x), r1=1(y), r2=69(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 1
LDI r2, 69
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
