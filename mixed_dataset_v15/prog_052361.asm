; DESCRIPTION: Creates a blue rectangular region at (109, 131) spanning 61 by 120 pixels.
; PLAN: r0=109(x), r1=131(y), r2=61(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 131
LDI r2, 61
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
