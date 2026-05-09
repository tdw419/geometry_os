; DESCRIPTION: Creates a blue rectangular region at (308, 61) spanning 74 by 15 pixels.
; PLAN: r0=308(x), r1=61(y), r2=74(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 61
LDI r2, 74
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
