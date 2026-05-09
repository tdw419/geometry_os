; DESCRIPTION: Creates a green rectangular region at (23, 194) spanning 20 by 30 pixels.
; PLAN: r0=23(x), r1=194(y), r2=20(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 194
LDI r2, 20
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
