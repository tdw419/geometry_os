; DESCRIPTION: Renders a black box of size 15x107 starting at (387, 23).
; PLAN: r0=387(x), r1=23(y), r2=15(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 23
LDI r2, 15
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
