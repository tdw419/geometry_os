; DESCRIPTION: Renders a green box of size 18x70 starting at (77, 98).
; PLAN: r0=77(x), r1=98(y), r2=18(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 98
LDI r2, 18
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
