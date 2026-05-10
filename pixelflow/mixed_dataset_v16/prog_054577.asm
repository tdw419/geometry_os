; DESCRIPTION: Creates a white rectangular region at (317, 144) spanning 35 by 77 pixels.
; PLAN: r0=317(x), r1=144(y), r2=35(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 144
LDI r2, 35
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
