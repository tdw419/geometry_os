; DESCRIPTION: Creates a green rectangular region at (307, 30) spanning 35 by 102 pixels.
; PLAN: r0=307(x), r1=30(y), r2=35(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 30
LDI r2, 35
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
