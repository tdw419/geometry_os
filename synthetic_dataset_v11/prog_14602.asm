; DESCRIPTION: Creates a blue rectangular region at (107, 167) spanning 24 by 10 pixels.
; PLAN: r0=107(x), r1=167(y), r2=24(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 167
LDI r2, 24
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
