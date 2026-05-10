; DESCRIPTION: Creates a blue rectangular region at (219, 140) spanning 41 by 27 pixels.
; PLAN: r0=219(x), r1=140(y), r2=41(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 140
LDI r2, 41
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
