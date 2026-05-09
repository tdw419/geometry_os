; DESCRIPTION: Creates a blue rectangular region at (75, 71) spanning 51 by 91 pixels.
; PLAN: r0=75(x), r1=71(y), r2=51(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 71
LDI r2, 51
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
