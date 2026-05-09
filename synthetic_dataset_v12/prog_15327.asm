; DESCRIPTION: Renders a blue box of size 103x14 starting at (33, 0).
; PLAN: r0=33(x), r1=0(y), r2=103(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 0
LDI r2, 103
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
