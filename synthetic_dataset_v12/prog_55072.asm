; DESCRIPTION: Renders a green box of size 73x83 starting at (226, 23).
; PLAN: r0=226(x), r1=23(y), r2=73(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 23
LDI r2, 73
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
