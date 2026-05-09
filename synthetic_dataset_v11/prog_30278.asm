; DESCRIPTION: Renders a green box of size 25x103 starting at (22, 112).
; PLAN: r0=22(x), r1=112(y), r2=25(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 112
LDI r2, 25
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
