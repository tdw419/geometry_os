; DESCRIPTION: Renders a yellow box of size 30x66 starting at (375, 80).
; PLAN: r0=375(x), r1=80(y), r2=30(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 80
LDI r2, 30
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
