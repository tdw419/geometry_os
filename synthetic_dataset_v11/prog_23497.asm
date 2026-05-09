; DESCRIPTION: Creates a yellow rectangular region at (11, 4) spanning 79 by 74 pixels.
; PLAN: r0=11(x), r1=4(y), r2=79(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 4
LDI r2, 79
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
