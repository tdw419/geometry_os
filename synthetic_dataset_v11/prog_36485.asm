; DESCRIPTION: Creates a blue rectangular region at (168, 93) spanning 58 by 73 pixels.
; PLAN: r0=168(x), r1=93(y), r2=58(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 93
LDI r2, 58
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
