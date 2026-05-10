; DESCRIPTION: Creates a white rectangular region at (51, 93) spanning 112 by 86 pixels.
; PLAN: r0=51(x), r1=93(y), r2=112(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 93
LDI r2, 112
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
