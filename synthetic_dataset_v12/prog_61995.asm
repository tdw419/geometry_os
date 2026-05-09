; DESCRIPTION: Renders a yellow box of size 112x101 starting at (398, 86).
; PLAN: r0=398(x), r1=86(y), r2=112(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 86
LDI r2, 112
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
