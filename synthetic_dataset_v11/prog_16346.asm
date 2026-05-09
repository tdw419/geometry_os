; DESCRIPTION: Renders a yellow box of size 20x76 starting at (72, 5).
; PLAN: r0=72(x), r1=5(y), r2=20(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 5
LDI r2, 20
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
