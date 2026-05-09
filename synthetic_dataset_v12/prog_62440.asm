; DESCRIPTION: Creates a yellow rectangular region at (162, 196) spanning 37 by 29 pixels.
; PLAN: r0=162(x), r1=196(y), r2=37(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 196
LDI r2, 37
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
