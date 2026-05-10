; DESCRIPTION: Creates a blue rectangular region at (382, 127) spanning 76 by 109 pixels.
; PLAN: r0=382(x), r1=127(y), r2=76(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 127
LDI r2, 76
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
