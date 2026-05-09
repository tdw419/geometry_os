; DESCRIPTION: Creates a yellow rectangular region at (66, 204) spanning 73 by 49 pixels.
; PLAN: r0=66(x), r1=204(y), r2=73(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 204
LDI r2, 73
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
