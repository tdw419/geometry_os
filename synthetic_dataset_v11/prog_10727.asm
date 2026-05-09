; DESCRIPTION: Creates a yellow rectangular region at (115, 94) spanning 12 by 40 pixels.
; PLAN: r0=115(x), r1=94(y), r2=12(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 94
LDI r2, 12
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
