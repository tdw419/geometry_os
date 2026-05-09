; DESCRIPTION: Renders a yellow box of size 18x90 starting at (125, 124).
; PLAN: r0=125(x), r1=124(y), r2=18(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 124
LDI r2, 18
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
