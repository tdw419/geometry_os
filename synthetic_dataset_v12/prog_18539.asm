; DESCRIPTION: Renders a black box of size 109x51 starting at (295, 99).
; PLAN: r0=295(x), r1=99(y), r2=109(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 99
LDI r2, 109
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
