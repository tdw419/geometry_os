; DESCRIPTION: Renders a purple box of size 54x117 starting at (333, 138).
; PLAN: r0=333(x), r1=138(y), r2=54(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 138
LDI r2, 54
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
