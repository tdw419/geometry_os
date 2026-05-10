; DESCRIPTION: Creates a white rectangular region at (321, 132) spanning 103 by 41 pixels.
; PLAN: r0=321(x), r1=132(y), r2=103(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 132
LDI r2, 103
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
