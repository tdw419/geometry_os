; DESCRIPTION: Renders a purple box of size 57x85 starting at (46, 121).
; PLAN: r0=46(x), r1=121(y), r2=57(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 121
LDI r2, 57
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
