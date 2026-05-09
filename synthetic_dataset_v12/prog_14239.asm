; DESCRIPTION: Renders a black box of size 20x22 starting at (1, 125).
; PLAN: r0=1(x), r1=125(y), r2=20(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 125
LDI r2, 20
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
