; DESCRIPTION: Creates a white rectangular region at (305, 7) spanning 110 by 47 pixels.
; PLAN: r0=305(x), r1=7(y), r2=110(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 7
LDI r2, 110
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
