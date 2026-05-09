; DESCRIPTION: Renders a cyan box of size 51x26 starting at (453, 116).
; PLAN: r0=453(x), r1=116(y), r2=51(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 116
LDI r2, 51
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
