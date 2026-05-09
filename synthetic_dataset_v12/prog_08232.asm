; DESCRIPTION: Creates a white rectangular region at (143, 144) spanning 17 by 81 pixels.
; PLAN: r0=143(x), r1=144(y), r2=17(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 144
LDI r2, 17
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
