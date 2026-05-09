; DESCRIPTION: Creates a blue rectangular region at (12, 31) spanning 60 by 47 pixels.
; PLAN: r0=12(x), r1=31(y), r2=60(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 31
LDI r2, 60
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
