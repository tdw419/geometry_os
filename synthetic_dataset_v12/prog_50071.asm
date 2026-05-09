; DESCRIPTION: Renders a purple box of size 59x18 starting at (23, 125).
; PLAN: r0=23(x), r1=125(y), r2=59(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 125
LDI r2, 59
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
