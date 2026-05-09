; DESCRIPTION: Creates a green rectangular region at (150, 126) spanning 119 by 34 pixels.
; PLAN: r0=150(x), r1=126(y), r2=119(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 126
LDI r2, 119
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
