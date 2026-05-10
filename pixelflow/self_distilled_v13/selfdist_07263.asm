; DESCRIPTION: Creates a blue filled rectangle of size 78x120 starting at (325, 171).
; PLAN: r0=325(x), r1=171(y), r2=78(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 171
LDI r2, 78
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
