; DESCRIPTION: Renders a purple box of size 109x74 starting at (366, 171).
; PLAN: r0=366(x), r1=171(y), r2=109(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 171
LDI r2, 109
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
