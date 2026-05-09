; DESCRIPTION: Renders a blue box of size 102x40 starting at (29, 146).
; PLAN: r0=29(x), r1=146(y), r2=102(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 146
LDI r2, 102
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
