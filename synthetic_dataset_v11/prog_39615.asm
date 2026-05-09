; DESCRIPTION: Creates a yellow rectangular region at (27, 76) spanning 18 by 44 pixels.
; PLAN: r0=27(x), r1=76(y), r2=18(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 76
LDI r2, 18
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
