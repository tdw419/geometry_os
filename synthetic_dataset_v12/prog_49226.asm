; DESCRIPTION: Creates a white rectangular region at (315, 209) spanning 53 by 19 pixels.
; PLAN: r0=315(x), r1=209(y), r2=53(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 209
LDI r2, 53
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
