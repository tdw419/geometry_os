; DESCRIPTION: Renders a blue box of size 47x12 starting at (188, 45).
; PLAN: r0=188(x), r1=45(y), r2=47(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 45
LDI r2, 47
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
