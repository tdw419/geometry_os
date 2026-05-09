; DESCRIPTION: Renders a blue box of size 68x34 starting at (281, 110).
; PLAN: r0=281(x), r1=110(y), r2=68(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 110
LDI r2, 68
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
