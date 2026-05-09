; DESCRIPTION: Creates a white rectangular region at (179, 11) spanning 70 by 107 pixels.
; PLAN: r0=179(x), r1=11(y), r2=70(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 11
LDI r2, 70
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
