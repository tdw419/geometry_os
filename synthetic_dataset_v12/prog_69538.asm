; DESCRIPTION: Creates a white rectangular region at (366, 132) spanning 61 by 107 pixels.
; PLAN: r0=366(x), r1=132(y), r2=61(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 132
LDI r2, 61
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
