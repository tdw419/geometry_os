; DESCRIPTION: Renders a purple box of size 99x108 starting at (61, 75).
; PLAN: r0=61(x), r1=75(y), r2=99(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 75
LDI r2, 99
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
