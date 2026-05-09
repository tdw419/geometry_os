; DESCRIPTION: Creates a white rectangular region at (178, 148) spanning 106 by 71 pixels.
; PLAN: r0=178(x), r1=148(y), r2=106(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 148
LDI r2, 106
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
