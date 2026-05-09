; DESCRIPTION: Renders a purple box of size 39x120 starting at (215, 78).
; PLAN: r0=215(x), r1=78(y), r2=39(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 78
LDI r2, 39
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
