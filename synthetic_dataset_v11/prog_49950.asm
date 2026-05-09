; DESCRIPTION: Creates a white rectangular region at (136, 19) spanning 81 by 16 pixels.
; PLAN: r0=136(x), r1=19(y), r2=81(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 19
LDI r2, 81
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
