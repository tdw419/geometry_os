; DESCRIPTION: Creates a yellow rectangular region at (179, 21) spanning 75 by 78 pixels.
; PLAN: r0=179(x), r1=21(y), r2=75(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 21
LDI r2, 75
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
