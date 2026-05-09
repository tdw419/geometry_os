; DESCRIPTION: Creates a white rectangular region at (53, 112) spanning 90 by 111 pixels.
; PLAN: r0=53(x), r1=112(y), r2=90(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 112
LDI r2, 90
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
