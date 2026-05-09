; DESCRIPTION: Renders a green box of size 95x44 starting at (347, 99).
; PLAN: r0=347(x), r1=99(y), r2=95(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 99
LDI r2, 95
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
