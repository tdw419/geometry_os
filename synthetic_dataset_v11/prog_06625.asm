; DESCRIPTION: Creates a white rectangular region at (1, 194) spanning 47 by 29 pixels.
; PLAN: r0=1(x), r1=194(y), r2=47(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 194
LDI r2, 47
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
