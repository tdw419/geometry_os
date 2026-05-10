; DESCRIPTION: Creates a white rectangular region at (112, 12) spanning 51 by 40 pixels.
; PLAN: r0=112(x), r1=12(y), r2=51(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 12
LDI r2, 51
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
