; DESCRIPTION: Renders a green box of size 77x13 starting at (84, 223).
; PLAN: r0=84(x), r1=223(y), r2=77(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 223
LDI r2, 77
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
