; DESCRIPTION: Renders a yellow box of size 97x112 starting at (150, 121).
; PLAN: r0=150(x), r1=121(y), r2=97(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 121
LDI r2, 97
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
