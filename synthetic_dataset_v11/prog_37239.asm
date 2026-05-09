; DESCRIPTION: Creates a green rectangular region at (230, 61) spanning 23 by 117 pixels.
; PLAN: r0=230(x), r1=61(y), r2=23(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 61
LDI r2, 23
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
