; DESCRIPTION: Creates a white rectangular region at (401, 137) spanning 51 by 74 pixels.
; PLAN: r0=401(x), r1=137(y), r2=51(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 137
LDI r2, 51
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
