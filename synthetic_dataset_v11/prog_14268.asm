; DESCRIPTION: Creates a white rectangular region at (169, 178) spanning 43 by 61 pixels.
; PLAN: r0=169(x), r1=178(y), r2=43(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 178
LDI r2, 43
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
