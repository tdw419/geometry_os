; DESCRIPTION: Creates a green rectangular region at (329, 18) spanning 44 by 21 pixels.
; PLAN: r0=329(x), r1=18(y), r2=44(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 18
LDI r2, 44
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
