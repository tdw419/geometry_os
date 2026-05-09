; DESCRIPTION: Creates a yellow rectangular region at (211, 226) spanning 35 by 18 pixels.
; PLAN: r0=211(x), r1=226(y), r2=35(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 226
LDI r2, 35
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
