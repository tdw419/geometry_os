; DESCRIPTION: Creates a blue rectangular region at (93, 87) spanning 120 by 24 pixels.
; PLAN: r0=93(x), r1=87(y), r2=120(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 87
LDI r2, 120
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
