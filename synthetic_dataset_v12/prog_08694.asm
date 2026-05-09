; DESCRIPTION: Renders a blue box of size 89x60 starting at (123, 176).
; PLAN: r0=123(x), r1=176(y), r2=89(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 176
LDI r2, 89
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
