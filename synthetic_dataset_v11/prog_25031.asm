; DESCRIPTION: Renders a blue box of size 54x40 starting at (121, 178).
; PLAN: r0=121(x), r1=178(y), r2=54(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 178
LDI r2, 54
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
