; DESCRIPTION: Creates a yellow rectangular region at (12, 77) spanning 98 by 112 pixels.
; PLAN: r0=12(x), r1=77(y), r2=98(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 77
LDI r2, 98
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
