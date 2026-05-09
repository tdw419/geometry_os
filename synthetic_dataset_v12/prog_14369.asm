; DESCRIPTION: Renders a yellow box of size 103x99 starting at (201, 39).
; PLAN: r0=201(x), r1=39(y), r2=103(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 39
LDI r2, 103
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
