; DESCRIPTION: Creates a yellow rectangular region at (202, 225) spanning 52 by 29 pixels.
; PLAN: r0=202(x), r1=225(y), r2=52(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 225
LDI r2, 52
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
