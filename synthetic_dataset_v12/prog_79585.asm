; DESCRIPTION: Creates a green rectangular region at (134, 162) spanning 30 by 13 pixels.
; PLAN: r0=134(x), r1=162(y), r2=30(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 162
LDI r2, 30
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
