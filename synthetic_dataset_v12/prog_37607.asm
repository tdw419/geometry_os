; DESCRIPTION: Creates a yellow rectangular region at (286, 194) spanning 52 by 26 pixels.
; PLAN: r0=286(x), r1=194(y), r2=52(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 194
LDI r2, 52
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
