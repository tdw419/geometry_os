; DESCRIPTION: Renders a purple box of size 108x74 starting at (380, 89).
; PLAN: r0=380(x), r1=89(y), r2=108(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 89
LDI r2, 108
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
