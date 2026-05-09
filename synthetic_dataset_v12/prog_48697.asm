; DESCRIPTION: Renders a yellow box of size 10x112 starting at (370, 4).
; PLAN: r0=370(x), r1=4(y), r2=10(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 4
LDI r2, 10
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
