; DESCRIPTION: Renders a blue box of size 15x31 starting at (492, 142).
; PLAN: r0=492(x), r1=142(y), r2=15(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 142
LDI r2, 15
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
