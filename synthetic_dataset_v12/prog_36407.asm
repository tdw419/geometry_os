; DESCRIPTION: Creates a green rectangular region at (333, 8) spanning 44 by 28 pixels.
; PLAN: r0=333(x), r1=8(y), r2=44(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 8
LDI r2, 44
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
