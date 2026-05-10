; DESCRIPTION: Creates a green rectangular region at (412, 124) spanning 20 by 40 pixels.
; PLAN: r0=412(x), r1=124(y), r2=20(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 124
LDI r2, 20
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
