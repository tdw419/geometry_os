; DESCRIPTION: Creates a white rectangular region at (142, 56) spanning 44 by 58 pixels.
; PLAN: r0=142(x), r1=56(y), r2=44(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 56
LDI r2, 44
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
