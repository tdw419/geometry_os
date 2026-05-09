; DESCRIPTION: Renders a blue box of size 15x29 starting at (160, 152).
; PLAN: r0=160(x), r1=152(y), r2=15(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 152
LDI r2, 15
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
