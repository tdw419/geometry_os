; DESCRIPTION: Creates a white rectangular region at (27, 39) spanning 45 by 110 pixels.
; PLAN: r0=27(x), r1=39(y), r2=45(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 39
LDI r2, 45
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
