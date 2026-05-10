; DESCRIPTION: Renders a red box of size 112x51 starting at (87, 21).
; PLAN: r0=87(x), r1=21(y), r2=112(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 21
LDI r2, 112
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
