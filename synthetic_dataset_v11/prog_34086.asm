; DESCRIPTION: Creates a yellow rectangular region at (12, 97) spanning 79 by 59 pixels.
; PLAN: r0=12(x), r1=97(y), r2=79(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 97
LDI r2, 79
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
