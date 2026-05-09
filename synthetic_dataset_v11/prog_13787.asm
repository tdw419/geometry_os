; DESCRIPTION: Renders a blue box of size 40x86 starting at (101, 13).
; PLAN: r0=101(x), r1=13(y), r2=40(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 13
LDI r2, 40
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
