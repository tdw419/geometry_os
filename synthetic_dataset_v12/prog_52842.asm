; DESCRIPTION: Creates a yellow rectangular region at (408, 75) spanning 77 by 87 pixels.
; PLAN: r0=408(x), r1=75(y), r2=77(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 75
LDI r2, 77
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
