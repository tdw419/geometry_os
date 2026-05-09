; DESCRIPTION: Creates a blue rectangular region at (289, 74) spanning 65 by 12 pixels.
; PLAN: r0=289(x), r1=74(y), r2=65(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 74
LDI r2, 65
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
