; DESCRIPTION: Renders a purple box of size 18x39 starting at (85, 83).
; PLAN: r0=85(x), r1=83(y), r2=18(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 83
LDI r2, 18
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
