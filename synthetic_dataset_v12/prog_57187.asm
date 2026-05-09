; DESCRIPTION: Renders a green box of size 66x29 starting at (216, 219).
; PLAN: r0=216(x), r1=219(y), r2=66(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 219
LDI r2, 66
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
