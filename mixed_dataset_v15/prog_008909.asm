; DESCRIPTION: Creates a white rectangular region at (233, 81) spanning 63 by 105 pixels.
; PLAN: r0=233(x), r1=81(y), r2=63(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 81
LDI r2, 63
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
