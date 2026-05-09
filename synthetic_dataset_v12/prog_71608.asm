; DESCRIPTION: Creates a blue rectangular region at (241, 220) spanning 58 by 34 pixels.
; PLAN: r0=241(x), r1=220(y), r2=58(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 220
LDI r2, 58
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
