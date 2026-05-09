; DESCRIPTION: Renders a blue box of size 79x72 starting at (38, 64).
; PLAN: r0=38(x), r1=64(y), r2=79(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 64
LDI r2, 79
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
