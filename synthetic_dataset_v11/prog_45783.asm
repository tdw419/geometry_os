; DESCRIPTION: Creates a white rectangular region at (172, 13) spanning 31 by 109 pixels.
; PLAN: r0=172(x), r1=13(y), r2=31(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 13
LDI r2, 31
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
