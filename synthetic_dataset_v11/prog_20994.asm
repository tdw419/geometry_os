; DESCRIPTION: Creates a green rectangular region at (135, 54) spanning 38 by 87 pixels.
; PLAN: r0=135(x), r1=54(y), r2=38(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 54
LDI r2, 38
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
