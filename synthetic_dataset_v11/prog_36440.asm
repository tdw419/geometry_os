; DESCRIPTION: Creates a yellow rectangular region at (9, 240) spanning 79 by 10 pixels.
; PLAN: r0=9(x), r1=240(y), r2=79(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 240
LDI r2, 79
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
