; DESCRIPTION: Renders a blue box of size 49x104 starting at (365, 96).
; PLAN: r0=365(x), r1=96(y), r2=49(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 96
LDI r2, 49
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
