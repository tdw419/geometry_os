; DESCRIPTION: Renders a black box of size 79x91 starting at (423, 125).
; PLAN: r0=423(x), r1=125(y), r2=79(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 125
LDI r2, 79
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
