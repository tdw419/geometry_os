; DESCRIPTION: Renders a blue box of size 94x91 starting at (406, 75).
; PLAN: r0=406(x), r1=75(y), r2=94(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 75
LDI r2, 94
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
