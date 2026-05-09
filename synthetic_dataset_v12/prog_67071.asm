; DESCRIPTION: Creates a white rectangular region at (393, 135) spanning 90 by 89 pixels.
; PLAN: r0=393(x), r1=135(y), r2=90(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 135
LDI r2, 90
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
