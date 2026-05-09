; DESCRIPTION: Creates a black rectangular region at (311, 103) spanning 91 by 115 pixels.
; PLAN: r0=311(x), r1=103(y), r2=91(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 103
LDI r2, 91
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
