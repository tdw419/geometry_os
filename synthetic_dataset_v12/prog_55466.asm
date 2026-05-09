; DESCRIPTION: Creates a white rectangular region at (111, 165) spanning 25 by 89 pixels.
; PLAN: r0=111(x), r1=165(y), r2=25(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 165
LDI r2, 25
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
