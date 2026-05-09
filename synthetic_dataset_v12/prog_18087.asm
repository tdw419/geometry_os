; DESCRIPTION: Creates a yellow rectangular region at (346, 134) spanning 119 by 17 pixels.
; PLAN: r0=346(x), r1=134(y), r2=119(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 134
LDI r2, 119
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
