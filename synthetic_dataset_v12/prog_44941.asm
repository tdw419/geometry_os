; DESCRIPTION: Renders a blue box of size 24x40 starting at (407, 7).
; PLAN: r0=407(x), r1=7(y), r2=24(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 7
LDI r2, 24
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
