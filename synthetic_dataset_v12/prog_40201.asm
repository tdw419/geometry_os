; DESCRIPTION: Creates a green rectangular region at (356, 54) spanning 19 by 69 pixels.
; PLAN: r0=356(x), r1=54(y), r2=19(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 54
LDI r2, 19
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
