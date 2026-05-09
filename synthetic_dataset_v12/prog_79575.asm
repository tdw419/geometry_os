; DESCRIPTION: Renders a yellow box of size 81x40 starting at (174, 193).
; PLAN: r0=174(x), r1=193(y), r2=81(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 193
LDI r2, 81
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
