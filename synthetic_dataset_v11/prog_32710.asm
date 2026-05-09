; DESCRIPTION: Creates a blue rectangular region at (114, 174) spanning 16 by 43 pixels.
; PLAN: r0=114(x), r1=174(y), r2=16(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 174
LDI r2, 16
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
