; DESCRIPTION: Creates a yellow rectangular region at (105, 24) spanning 79 by 87 pixels.
; PLAN: r0=105(x), r1=24(y), r2=79(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 24
LDI r2, 79
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
