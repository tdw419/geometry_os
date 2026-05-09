; DESCRIPTION: Renders a blue box of size 56x95 starting at (418, 25).
; PLAN: r0=418(x), r1=25(y), r2=56(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 25
LDI r2, 56
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
