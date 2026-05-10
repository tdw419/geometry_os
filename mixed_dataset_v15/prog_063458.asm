; DESCRIPTION: Creates a yellow rectangular region at (166, 5) spanning 115 by 79 pixels.
; PLAN: r0=166(x), r1=5(y), r2=115(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 5
LDI r2, 115
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
