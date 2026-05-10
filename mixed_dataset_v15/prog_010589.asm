; DESCRIPTION: Creates a blue rectangular region at (364, 93) spanning 80 by 39 pixels.
; PLAN: r0=364(x), r1=93(y), r2=80(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 93
LDI r2, 80
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
