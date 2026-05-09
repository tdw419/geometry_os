; DESCRIPTION: Renders a blue box of size 93x39 starting at (16, 51).
; PLAN: r0=16(x), r1=51(y), r2=93(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 51
LDI r2, 93
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
