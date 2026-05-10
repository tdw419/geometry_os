; DESCRIPTION: Renders a blue box of size 101x65 starting at (213, 48).
; PLAN: r0=213(x), r1=48(y), r2=101(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 48
LDI r2, 101
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
