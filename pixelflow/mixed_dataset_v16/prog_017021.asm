; DESCRIPTION: Renders a purple box of size 44x38 starting at (421, 74).
; PLAN: r0=421(x), r1=74(y), r2=44(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 74
LDI r2, 44
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
