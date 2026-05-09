; DESCRIPTION: Creates a white rectangular region at (75, 31) spanning 50 by 105 pixels.
; PLAN: r0=75(x), r1=31(y), r2=50(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 31
LDI r2, 50
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
