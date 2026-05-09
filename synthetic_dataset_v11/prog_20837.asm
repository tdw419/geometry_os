; DESCRIPTION: Creates a green rectangular region at (141, 148) spanning 87 by 18 pixels.
; PLAN: r0=141(x), r1=148(y), r2=87(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 148
LDI r2, 87
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
