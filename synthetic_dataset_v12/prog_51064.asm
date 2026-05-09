; DESCRIPTION: Renders a black box of size 75x51 starting at (263, 98).
; PLAN: r0=263(x), r1=98(y), r2=75(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 98
LDI r2, 75
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
