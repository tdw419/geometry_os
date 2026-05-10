; DESCRIPTION: Creates a white rectangular region at (142, 113) spanning 69 by 87 pixels.
; PLAN: r0=142(x), r1=113(y), r2=69(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 113
LDI r2, 69
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
