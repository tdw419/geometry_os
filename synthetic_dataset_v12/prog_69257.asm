; DESCRIPTION: Creates a blue rectangular region at (54, 31) spanning 93 by 87 pixels.
; PLAN: r0=54(x), r1=31(y), r2=93(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 31
LDI r2, 93
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
