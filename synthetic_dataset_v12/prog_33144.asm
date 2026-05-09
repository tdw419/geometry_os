; DESCRIPTION: Creates a white rectangular region at (69, 44) spanning 28 by 100 pixels.
; PLAN: r0=69(x), r1=44(y), r2=28(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 44
LDI r2, 28
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
