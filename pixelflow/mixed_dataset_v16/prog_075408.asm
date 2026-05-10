; DESCRIPTION: Creates a green rectangular region at (313, 33) spanning 28 by 81 pixels.
; PLAN: r0=313(x), r1=33(y), r2=28(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 33
LDI r2, 28
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
