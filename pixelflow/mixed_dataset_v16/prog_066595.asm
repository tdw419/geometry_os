; DESCRIPTION: Creates a white rectangular region at (432, 59) spanning 44 by 73 pixels.
; PLAN: r0=432(x), r1=59(y), r2=44(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 59
LDI r2, 44
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
