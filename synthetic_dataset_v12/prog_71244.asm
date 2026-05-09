; DESCRIPTION: Creates a green rectangular region at (138, 9) spanning 87 by 54 pixels.
; PLAN: r0=138(x), r1=9(y), r2=87(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 9
LDI r2, 87
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
