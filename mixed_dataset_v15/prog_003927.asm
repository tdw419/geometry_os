; DESCRIPTION: Renders a blue box of size 57x26 starting at (185, 163).
; PLAN: r0=185(x), r1=163(y), r2=57(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 163
LDI r2, 57
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
