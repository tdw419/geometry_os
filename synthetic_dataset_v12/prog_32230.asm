; DESCRIPTION: Renders a green box of size 57x119 starting at (337, 33).
; PLAN: r0=337(x), r1=33(y), r2=57(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 33
LDI r2, 57
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
