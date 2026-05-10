; DESCRIPTION: Renders a blue box of size 64x38 starting at (342, 3).
; PLAN: r0=342(x), r1=3(y), r2=64(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 3
LDI r2, 64
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
