; DESCRIPTION: Creates a yellow rectangular region at (425, 134) spanning 69 by 119 pixels.
; PLAN: r0=425(x), r1=134(y), r2=69(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 134
LDI r2, 69
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
