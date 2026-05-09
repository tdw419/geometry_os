; DESCRIPTION: Creates a white rectangular region at (34, 107) spanning 35 by 111 pixels.
; PLAN: r0=34(x), r1=107(y), r2=35(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 107
LDI r2, 35
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
