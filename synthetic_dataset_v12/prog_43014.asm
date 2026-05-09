; DESCRIPTION: Creates a white rectangular region at (0, 72) spanning 109 by 43 pixels.
; PLAN: r0=0(x), r1=72(y), r2=109(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 72
LDI r2, 109
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
