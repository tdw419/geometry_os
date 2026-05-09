; DESCRIPTION: Creates a white rectangular region at (181, 99) spanning 107 by 25 pixels.
; PLAN: r0=181(x), r1=99(y), r2=107(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 99
LDI r2, 107
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
