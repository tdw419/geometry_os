; DESCRIPTION: Renders a green box of size 91x52 starting at (285, 39).
; PLAN: r0=285(x), r1=39(y), r2=91(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 39
LDI r2, 91
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
