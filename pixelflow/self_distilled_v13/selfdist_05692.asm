; DESCRIPTION: Renders a white rectangular region spanning 49 by 81 at (96, 152).
; PLAN: r0=96(x), r1=152(y), r2=49(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 152
LDI r2, 49
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
