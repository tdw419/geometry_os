; DESCRIPTION: Creates a white rectangular region at (110, 114) spanning 98 by 105 pixels.
; PLAN: r0=110(x), r1=114(y), r2=98(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 114
LDI r2, 98
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
