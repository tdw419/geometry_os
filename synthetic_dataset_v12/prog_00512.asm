; DESCRIPTION: Renders a blue box of size 46x93 starting at (458, 23).
; PLAN: r0=458(x), r1=23(y), r2=46(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 23
LDI r2, 46
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
