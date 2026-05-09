; DESCRIPTION: Renders a yellow box of size 120x79 starting at (86, 58).
; PLAN: r0=86(x), r1=58(y), r2=120(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 58
LDI r2, 120
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
