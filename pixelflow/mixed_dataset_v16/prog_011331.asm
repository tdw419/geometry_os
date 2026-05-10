; DESCRIPTION: Creates a green rectangular region at (3, 4) spanning 20 by 16 pixels.
; PLAN: r0=3(x), r1=4(y), r2=20(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 4
LDI r2, 20
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
