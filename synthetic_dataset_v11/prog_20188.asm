; DESCRIPTION: Creates a blue rectangular region at (28, 138) spanning 46 by 115 pixels.
; PLAN: r0=28(x), r1=138(y), r2=46(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 138
LDI r2, 46
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
