; DESCRIPTION: Creates a blue rectangular region at (174, 23) spanning 24 by 115 pixels.
; PLAN: r0=174(x), r1=23(y), r2=24(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 23
LDI r2, 24
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
