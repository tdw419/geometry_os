; DESCRIPTION: Renders a blue box of size 119x22 starting at (54, 146).
; PLAN: r0=54(x), r1=146(y), r2=119(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 146
LDI r2, 119
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
