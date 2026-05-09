; DESCRIPTION: Creates a green rectangular region at (124, 132) spanning 41 by 32 pixels.
; PLAN: r0=124(x), r1=132(y), r2=41(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 132
LDI r2, 41
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
