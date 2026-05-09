; DESCRIPTION: Renders a blue box of size 61x47 starting at (355, 80).
; PLAN: r0=355(x), r1=80(y), r2=61(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 80
LDI r2, 61
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
