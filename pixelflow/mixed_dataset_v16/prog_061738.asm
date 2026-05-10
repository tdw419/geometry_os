; DESCRIPTION: Renders a purple box of size 101x91 starting at (247, 48).
; PLAN: r0=247(x), r1=48(y), r2=101(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 48
LDI r2, 101
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
