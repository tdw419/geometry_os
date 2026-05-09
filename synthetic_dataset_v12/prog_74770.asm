; DESCRIPTION: Renders a blue box of size 21x22 starting at (7, 3).
; PLAN: r0=7(x), r1=3(y), r2=21(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 3
LDI r2, 21
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
