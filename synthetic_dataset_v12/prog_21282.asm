; DESCRIPTION: Renders a blue box of size 111x108 starting at (60, 96).
; PLAN: r0=60(x), r1=96(y), r2=111(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 96
LDI r2, 111
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
