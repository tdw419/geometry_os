; DESCRIPTION: Renders a yellow box of size 87x75 starting at (412, 6).
; PLAN: r0=412(x), r1=6(y), r2=87(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 6
LDI r2, 87
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
