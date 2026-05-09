; DESCRIPTION: Renders a yellow box of size 113x23 starting at (24, 85).
; PLAN: r0=24(x), r1=85(y), r2=113(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 85
LDI r2, 113
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
