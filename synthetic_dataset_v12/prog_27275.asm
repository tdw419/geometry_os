; DESCRIPTION: Creates a blue rectangular region at (356, 18) spanning 23 by 41 pixels.
; PLAN: r0=356(x), r1=18(y), r2=23(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 18
LDI r2, 23
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
