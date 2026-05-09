; DESCRIPTION: Creates a blue rectangular region at (289, 131) spanning 87 by 66 pixels.
; PLAN: r0=289(x), r1=131(y), r2=87(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 131
LDI r2, 87
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
