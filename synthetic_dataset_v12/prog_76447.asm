; DESCRIPTION: Creates a green rectangular region at (338, 179) spanning 44 by 40 pixels.
; PLAN: r0=338(x), r1=179(y), r2=44(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 179
LDI r2, 44
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
