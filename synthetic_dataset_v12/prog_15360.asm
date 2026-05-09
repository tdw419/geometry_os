; DESCRIPTION: Renders a blue box of size 40x86 starting at (396, 33).
; PLAN: r0=396(x), r1=33(y), r2=40(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 33
LDI r2, 40
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
