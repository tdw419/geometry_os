; DESCRIPTION: Renders a green box of size 54x80 starting at (98, 35).
; PLAN: r0=98(x), r1=35(y), r2=54(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 35
LDI r2, 54
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
