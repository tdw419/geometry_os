; DESCRIPTION: Renders a white box of size 90x51 starting at (124, 190).
; PLAN: r0=124(x), r1=190(y), r2=90(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 190
LDI r2, 90
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
