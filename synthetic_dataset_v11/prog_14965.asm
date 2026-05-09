; DESCRIPTION: Creates a white rectangular region at (18, 127) spanning 19 by 116 pixels.
; PLAN: r0=18(x), r1=127(y), r2=19(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 127
LDI r2, 19
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
