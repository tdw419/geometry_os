; DESCRIPTION: Creates a white rectangular region at (419, 22) spanning 20 by 36 pixels.
; PLAN: r0=419(x), r1=22(y), r2=20(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 22
LDI r2, 20
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
