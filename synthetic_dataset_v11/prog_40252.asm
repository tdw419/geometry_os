; DESCRIPTION: Renders a yellow box of size 120x43 starting at (1, 125).
; PLAN: r0=1(x), r1=125(y), r2=120(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 125
LDI r2, 120
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
