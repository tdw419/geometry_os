; DESCRIPTION: Creates a white rectangular region at (399, 68) spanning 18 by 36 pixels.
; PLAN: r0=399(x), r1=68(y), r2=18(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 68
LDI r2, 18
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
