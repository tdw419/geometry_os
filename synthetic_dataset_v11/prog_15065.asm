; DESCRIPTION: Creates a blue rectangular region at (95, 48) spanning 13 by 93 pixels.
; PLAN: r0=95(x), r1=48(y), r2=13(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 48
LDI r2, 13
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
