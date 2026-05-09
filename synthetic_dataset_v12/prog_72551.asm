; DESCRIPTION: Renders a blue box of size 98x45 starting at (322, 161).
; PLAN: r0=322(x), r1=161(y), r2=98(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 161
LDI r2, 98
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
