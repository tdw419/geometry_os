; DESCRIPTION: Renders a yellow box of size 84x89 starting at (399, 134).
; PLAN: r0=399(x), r1=134(y), r2=84(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 134
LDI r2, 84
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
