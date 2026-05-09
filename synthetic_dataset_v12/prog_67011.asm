; DESCRIPTION: Creates a blue rectangular region at (408, 52) spanning 78 by 61 pixels.
; PLAN: r0=408(x), r1=52(y), r2=78(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 52
LDI r2, 78
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
