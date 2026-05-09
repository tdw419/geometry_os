; DESCRIPTION: Renders a blue box of size 107x99 starting at (48, 156).
; PLAN: r0=48(x), r1=156(y), r2=107(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 156
LDI r2, 107
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
