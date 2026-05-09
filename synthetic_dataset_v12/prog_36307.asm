; DESCRIPTION: Creates a yellow rectangular region at (286, 159) spanning 54 by 12 pixels.
; PLAN: r0=286(x), r1=159(y), r2=54(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 159
LDI r2, 54
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
