; DESCRIPTION: Renders a purple box of size 51x86 starting at (209, 74).
; PLAN: r0=209(x), r1=74(y), r2=51(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 74
LDI r2, 51
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
