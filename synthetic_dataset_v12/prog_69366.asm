; DESCRIPTION: Renders a green box of size 93x97 starting at (285, 35).
; PLAN: r0=285(x), r1=35(y), r2=93(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 35
LDI r2, 93
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
