; DESCRIPTION: Creates a blue rectangular region at (180, 93) spanning 76 by 86 pixels.
; PLAN: r0=180(x), r1=93(y), r2=76(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 93
LDI r2, 76
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
