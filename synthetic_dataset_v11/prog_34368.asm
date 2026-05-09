; DESCRIPTION: Creates a green rectangular region at (35, 30) spanning 103 by 28 pixels.
; PLAN: r0=35(x), r1=30(y), r2=103(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 30
LDI r2, 103
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
