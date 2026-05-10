; DESCRIPTION: Renders a yellow box of size 57x36 starting at (57, 185).
; PLAN: r0=57(x), r1=185(y), r2=57(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 185
LDI r2, 57
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
