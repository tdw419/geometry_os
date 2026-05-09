; DESCRIPTION: Creates a green rectangular region at (130, 133) spanning 26 by 96 pixels.
; PLAN: r0=130(x), r1=133(y), r2=26(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 133
LDI r2, 26
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
