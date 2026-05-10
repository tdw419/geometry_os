; DESCRIPTION: Creates a blue rectangular region at (206, 115) spanning 12 by 93 pixels.
; PLAN: r0=206(x), r1=115(y), r2=12(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 115
LDI r2, 12
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
