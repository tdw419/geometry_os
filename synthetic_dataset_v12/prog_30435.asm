; DESCRIPTION: Renders a purple box of size 51x116 starting at (213, 16).
; PLAN: r0=213(x), r1=16(y), r2=51(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 16
LDI r2, 51
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
