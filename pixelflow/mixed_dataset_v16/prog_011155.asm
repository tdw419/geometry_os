; DESCRIPTION: Creates a white rectangular region at (250, 24) spanning 109 by 112 pixels.
; PLAN: r0=250(x), r1=24(y), r2=109(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 24
LDI r2, 109
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
