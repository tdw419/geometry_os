; DESCRIPTION: Creates a white rectangular region at (300, 111) spanning 19 by 20 pixels.
; PLAN: r0=300(x), r1=111(y), r2=19(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 111
LDI r2, 19
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
