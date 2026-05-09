; DESCRIPTION: Creates a white rectangular region at (226, 135) spanning 27 by 116 pixels.
; PLAN: r0=226(x), r1=135(y), r2=27(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 135
LDI r2, 27
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
