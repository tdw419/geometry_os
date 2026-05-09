; DESCRIPTION: Creates a blue rectangular region at (89, 27) spanning 91 by 51 pixels.
; PLAN: r0=89(x), r1=27(y), r2=91(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 27
LDI r2, 91
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
