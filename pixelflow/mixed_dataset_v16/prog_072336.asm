; DESCRIPTION: Creates a yellow rectangular region at (151, 226) spanning 100 by 12 pixels.
; PLAN: r0=151(x), r1=226(y), r2=100(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 226
LDI r2, 100
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
