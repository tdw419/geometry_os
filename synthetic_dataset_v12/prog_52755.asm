; DESCRIPTION: Creates a blue rectangular region at (389, 131) spanning 27 by 12 pixels.
; PLAN: r0=389(x), r1=131(y), r2=27(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 131
LDI r2, 27
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
