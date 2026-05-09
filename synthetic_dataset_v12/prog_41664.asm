; DESCRIPTION: Creates a blue rectangular region at (289, 131) spanning 92 by 44 pixels.
; PLAN: r0=289(x), r1=131(y), r2=92(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 131
LDI r2, 92
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
