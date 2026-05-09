; DESCRIPTION: Creates a white rectangular region at (285, 111) spanning 48 by 46 pixels.
; PLAN: r0=285(x), r1=111(y), r2=48(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 111
LDI r2, 48
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
