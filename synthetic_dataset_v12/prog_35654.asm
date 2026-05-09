; DESCRIPTION: Renders a purple box of size 24x51 starting at (186, 27).
; PLAN: r0=186(x), r1=27(y), r2=24(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 27
LDI r2, 24
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
