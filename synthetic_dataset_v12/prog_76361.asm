; DESCRIPTION: Creates a white rectangular region at (469, 89) spanning 22 by 111 pixels.
; PLAN: r0=469(x), r1=89(y), r2=22(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 89
LDI r2, 22
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
