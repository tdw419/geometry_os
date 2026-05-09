; DESCRIPTION: Creates a blue rectangular region at (174, 24) spanning 23 by 58 pixels.
; PLAN: r0=174(x), r1=24(y), r2=23(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 24
LDI r2, 23
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
