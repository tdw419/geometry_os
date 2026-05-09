; DESCRIPTION: Creates a green rectangular region at (16, 88) spanning 103 by 14 pixels.
; PLAN: r0=16(x), r1=88(y), r2=103(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 88
LDI r2, 103
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
