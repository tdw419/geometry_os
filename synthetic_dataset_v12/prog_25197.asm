; DESCRIPTION: Renders a yellow box of size 87x36 starting at (225, 15).
; PLAN: r0=225(x), r1=15(y), r2=87(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 15
LDI r2, 87
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
