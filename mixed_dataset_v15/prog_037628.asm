; DESCRIPTION: Creates a green rectangular region at (135, 109) spanning 46 by 20 pixels.
; PLAN: r0=135(x), r1=109(y), r2=46(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 109
LDI r2, 46
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
