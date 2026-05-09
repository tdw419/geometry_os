; DESCRIPTION: Creates a green rectangular region at (15, 120) spanning 94 by 91 pixels.
; PLAN: r0=15(x), r1=120(y), r2=94(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 120
LDI r2, 94
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
