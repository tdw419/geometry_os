; DESCRIPTION: Creates a yellow rectangular region at (259, 174) spanning 33 by 25 pixels.
; PLAN: r0=259(x), r1=174(y), r2=33(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 174
LDI r2, 33
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
