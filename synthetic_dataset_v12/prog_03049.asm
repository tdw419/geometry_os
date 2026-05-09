; DESCRIPTION: Renders a yellow box of size 16x70 starting at (55, 72).
; PLAN: r0=55(x), r1=72(y), r2=16(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 72
LDI r2, 16
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
