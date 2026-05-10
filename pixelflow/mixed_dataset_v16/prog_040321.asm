; DESCRIPTION: Renders a white box of size 61x118 starting at (256, 131).
; PLAN: r0=256(x), r1=131(y), r2=61(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 131
LDI r2, 61
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
