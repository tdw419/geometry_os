; DESCRIPTION: Renders a yellow box of size 78x112 starting at (90, 86).
; PLAN: r0=90(x), r1=86(y), r2=78(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 86
LDI r2, 78
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
