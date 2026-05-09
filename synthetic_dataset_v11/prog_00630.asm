; DESCRIPTION: Renders a yellow box of size 12x110 starting at (177, 80).
; PLAN: r0=177(x), r1=80(y), r2=12(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 80
LDI r2, 12
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
