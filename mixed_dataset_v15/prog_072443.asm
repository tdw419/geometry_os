; DESCRIPTION: Creates a yellow rectangular region at (156, 71) spanning 105 by 77 pixels.
; PLAN: r0=156(x), r1=71(y), r2=105(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 71
LDI r2, 105
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
