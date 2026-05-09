; DESCRIPTION: Creates a white rectangular region at (370, 172) spanning 36 by 19 pixels.
; PLAN: r0=370(x), r1=172(y), r2=36(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 172
LDI r2, 36
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
