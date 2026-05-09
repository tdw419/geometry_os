; DESCRIPTION: Renders a yellow box of size 23x33 starting at (209, 66).
; PLAN: r0=209(x), r1=66(y), r2=23(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 66
LDI r2, 23
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
