; DESCRIPTION: Renders a blue box of size 108x89 starting at (202, 96).
; PLAN: r0=202(x), r1=96(y), r2=108(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 96
LDI r2, 108
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
