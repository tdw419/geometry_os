; DESCRIPTION: Creates a green rectangular region at (288, 196) spanning 83 by 33 pixels.
; PLAN: r0=288(x), r1=196(y), r2=83(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 196
LDI r2, 83
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
