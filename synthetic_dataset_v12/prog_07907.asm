; DESCRIPTION: Renders a yellow box of size 57x110 starting at (252, 4).
; PLAN: r0=252(x), r1=4(y), r2=57(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 4
LDI r2, 57
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
