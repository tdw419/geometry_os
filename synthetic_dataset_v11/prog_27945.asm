; DESCRIPTION: Creates a white rectangular region at (140, 15) spanning 87 by 103 pixels.
; PLAN: r0=140(x), r1=15(y), r2=87(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 15
LDI r2, 87
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
