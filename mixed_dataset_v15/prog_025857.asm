; DESCRIPTION: Creates a green rectangular region at (182, 25) spanning 13 by 100 pixels.
; PLAN: r0=182(x), r1=25(y), r2=13(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 25
LDI r2, 13
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
