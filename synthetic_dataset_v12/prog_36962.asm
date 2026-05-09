; DESCRIPTION: Creates a blue rectangular region at (186, 93) spanning 49 by 55 pixels.
; PLAN: r0=186(x), r1=93(y), r2=49(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 93
LDI r2, 49
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
