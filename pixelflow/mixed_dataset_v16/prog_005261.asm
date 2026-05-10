; DESCRIPTION: Creates a green rectangular region at (191, 135) spanning 80 by 14 pixels.
; PLAN: r0=191(x), r1=135(y), r2=80(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 135
LDI r2, 80
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
