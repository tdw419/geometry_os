; DESCRIPTION: Renders a purple box of size 34x103 starting at (43, 83).
; PLAN: r0=43(x), r1=83(y), r2=34(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 83
LDI r2, 34
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
