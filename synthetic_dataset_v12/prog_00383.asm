; DESCRIPTION: Creates a blue rectangular region at (259, 74) spanning 75 by 75 pixels.
; PLAN: r0=259(x), r1=74(y), r2=75(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 74
LDI r2, 75
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
