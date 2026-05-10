; DESCRIPTION: Renders a green rectangular region spanning 76 by 35 at (218, 151).
; PLAN: r0=218(x), r1=151(y), r2=76(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 151
LDI r2, 76
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
