; DESCRIPTION: Renders a blue box of size 28x98 starting at (146, 88).
; PLAN: r0=146(x), r1=88(y), r2=28(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 88
LDI r2, 28
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
