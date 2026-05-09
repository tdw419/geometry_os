; DESCRIPTION: Creates a white rectangular region at (175, 27) spanning 81 by 100 pixels.
; PLAN: r0=175(x), r1=27(y), r2=81(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 27
LDI r2, 81
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
