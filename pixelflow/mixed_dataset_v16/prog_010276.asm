; DESCRIPTION: Creates a green rectangular region at (97, 117) spanning 67 by 52 pixels.
; PLAN: r0=97(x), r1=117(y), r2=67(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 117
LDI r2, 67
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
