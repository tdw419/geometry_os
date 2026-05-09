; DESCRIPTION: Creates a blue rectangular region at (253, 60) spanning 31 by 44 pixels.
; PLAN: r0=253(x), r1=60(y), r2=31(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 60
LDI r2, 31
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
