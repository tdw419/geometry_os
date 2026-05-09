; DESCRIPTION: Renders a blue box of size 65x56 starting at (58, 146).
; PLAN: r0=58(x), r1=146(y), r2=65(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 146
LDI r2, 65
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
