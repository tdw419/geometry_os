; DESCRIPTION: Creates a green rectangular region at (101, 220) spanning 57 by 33 pixels.
; PLAN: r0=101(x), r1=220(y), r2=57(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 220
LDI r2, 57
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
