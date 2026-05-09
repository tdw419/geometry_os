; DESCRIPTION: Renders a green box of size 52x51 starting at (456, 196).
; PLAN: r0=456(x), r1=196(y), r2=52(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 196
LDI r2, 52
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
