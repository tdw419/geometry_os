; DESCRIPTION: Creates a yellow rectangular region at (71, 196) spanning 29 by 18 pixels.
; PLAN: r0=71(x), r1=196(y), r2=29(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 196
LDI r2, 29
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
