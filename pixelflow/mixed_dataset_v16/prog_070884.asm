; DESCRIPTION: Creates a white rectangular region at (311, 132) spanning 48 by 53 pixels.
; PLAN: r0=311(x), r1=132(y), r2=48(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 132
LDI r2, 48
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
