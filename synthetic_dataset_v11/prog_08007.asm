; DESCRIPTION: Creates a green rectangular region at (16, 90) spanning 26 by 70 pixels.
; PLAN: r0=16(x), r1=90(y), r2=26(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 90
LDI r2, 26
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
