; DESCRIPTION: Renders a green box of size 10x98 starting at (98, 85).
; PLAN: r0=98(x), r1=85(y), r2=10(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 85
LDI r2, 10
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
