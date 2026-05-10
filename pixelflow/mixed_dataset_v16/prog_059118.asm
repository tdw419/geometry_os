; DESCRIPTION: Renders a yellow box of size 35x60 starting at (218, 97).
; PLAN: r0=218(x), r1=97(y), r2=35(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 97
LDI r2, 35
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
