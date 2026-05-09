; DESCRIPTION: Creates a yellow rectangular region at (229, 50) spanning 66 by 114 pixels.
; PLAN: r0=229(x), r1=50(y), r2=66(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 50
LDI r2, 66
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
