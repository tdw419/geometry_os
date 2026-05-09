; DESCRIPTION: Renders a purple box of size 105x48 starting at (209, 171).
; PLAN: r0=209(x), r1=171(y), r2=105(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 171
LDI r2, 105
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
