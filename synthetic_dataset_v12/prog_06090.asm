; DESCRIPTION: Creates a yellow rectangular region at (381, 127) spanning 87 by 29 pixels.
; PLAN: r0=381(x), r1=127(y), r2=87(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 127
LDI r2, 87
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
