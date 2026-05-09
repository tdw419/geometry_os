; DESCRIPTION: Creates a blue rectangular region at (161, 131) spanning 95 by 86 pixels.
; PLAN: r0=161(x), r1=131(y), r2=95(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 131
LDI r2, 95
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
