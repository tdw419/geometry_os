; DESCRIPTION: Creates a yellow rectangular region at (137, 61) spanning 30 by 77 pixels.
; PLAN: r0=137(x), r1=61(y), r2=30(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 61
LDI r2, 30
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
