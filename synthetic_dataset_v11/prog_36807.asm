; DESCRIPTION: Creates a yellow rectangular region at (115, 135) spanning 75 by 107 pixels.
; PLAN: r0=115(x), r1=135(y), r2=75(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 135
LDI r2, 75
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
