; DESCRIPTION: Creates a white rectangular region at (3, 103) spanning 29 by 115 pixels.
; PLAN: r0=3(x), r1=103(y), r2=29(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 103
LDI r2, 29
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
