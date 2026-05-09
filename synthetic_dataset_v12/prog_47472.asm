; DESCRIPTION: Creates a green rectangular region at (179, 161) spanning 52 by 80 pixels.
; PLAN: r0=179(x), r1=161(y), r2=52(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 161
LDI r2, 52
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
