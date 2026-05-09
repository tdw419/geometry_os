; DESCRIPTION: Renders a yellow box of size 57x30 starting at (105, 106).
; PLAN: r0=105(x), r1=106(y), r2=57(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 106
LDI r2, 57
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
