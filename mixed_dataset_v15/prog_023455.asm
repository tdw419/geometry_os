; DESCRIPTION: Creates a yellow rectangular region at (141, 125) spanning 28 by 73 pixels.
; PLAN: r0=141(x), r1=125(y), r2=28(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 125
LDI r2, 28
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
