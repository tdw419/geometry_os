; DESCRIPTION: Creates a green rectangular region at (68, 183) spanning 99 by 10 pixels.
; PLAN: r0=68(x), r1=183(y), r2=99(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 183
LDI r2, 99
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
