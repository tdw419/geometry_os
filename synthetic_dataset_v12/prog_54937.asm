; DESCRIPTION: Renders a green box of size 109x84 starting at (345, 61).
; PLAN: r0=345(x), r1=61(y), r2=109(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 61
LDI r2, 109
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
