; DESCRIPTION: Creates a black rectangular region at (174, 105) spanning 103 by 71 pixels.
; PLAN: r0=174(x), r1=105(y), r2=103(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 105
LDI r2, 103
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
