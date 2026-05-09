; DESCRIPTION: Renders a yellow box of size 117x117 starting at (56, 134).
; PLAN: r0=56(x), r1=134(y), r2=117(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 134
LDI r2, 117
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
