; DESCRIPTION: Creates a white rectangular region at (106, 90) spanning 29 by 111 pixels.
; PLAN: r0=106(x), r1=90(y), r2=29(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 90
LDI r2, 29
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
