; DESCRIPTION: Creates a white rectangular region at (313, 166) spanning 38 by 73 pixels.
; PLAN: r0=313(x), r1=166(y), r2=38(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 166
LDI r2, 38
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
