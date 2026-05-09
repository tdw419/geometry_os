; DESCRIPTION: Creates a white rectangular region at (372, 47) spanning 110 by 18 pixels.
; PLAN: r0=372(x), r1=47(y), r2=110(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 47
LDI r2, 110
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
