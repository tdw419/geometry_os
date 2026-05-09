; DESCRIPTION: Creates a green rectangular region at (326, 60) spanning 47 by 89 pixels.
; PLAN: r0=326(x), r1=60(y), r2=47(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 60
LDI r2, 47
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
