; DESCRIPTION: Renders a green box of size 94x78 starting at (80, 35).
; PLAN: r0=80(x), r1=35(y), r2=94(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 35
LDI r2, 94
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
