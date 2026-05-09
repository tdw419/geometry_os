; DESCRIPTION: Renders a yellow box of size 50x110 starting at (188, 133).
; PLAN: r0=188(x), r1=133(y), r2=50(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 133
LDI r2, 50
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
