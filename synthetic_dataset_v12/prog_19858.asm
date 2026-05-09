; DESCRIPTION: Renders a yellow box of size 50x72 starting at (110, 89).
; PLAN: r0=110(x), r1=89(y), r2=50(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 89
LDI r2, 50
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
