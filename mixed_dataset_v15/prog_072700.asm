; DESCRIPTION: Creates a green rectangular region at (254, 39) spanning 117 by 24 pixels.
; PLAN: r0=254(x), r1=39(y), r2=117(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 39
LDI r2, 117
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
